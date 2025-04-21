//---- DEFINES ----

#define QSIZE 32
#define FIELD_SIZE 32
#define NULL '\0'

//---- EXTERNAL VARIABLES ----

volatile extern int ISTATE;
volatile extern int CURR_CHAR;
volatile extern int UPDATE;
volatile extern int START_STOP;
volatile extern int BORN;
volatile extern int SURV;
volatile extern int LINE_ADR;
volatile extern int CELL_ADR;
volatile extern int VALUE;

//---- QUEUE VARIABLES ----

volatile int queue[QSIZE];
volatile int head;
volatile int end;

//---- QUEUE FUNCTIONS ----

void qInit()
{
    for (int i = 0; i < QSIZE; i++)
        queue[i] = 0;
    head = 0;
    end = 0;
}

//---- STRING FUNCTIONS ----

int isNum(char symbol)
{
    if (symbol >= '0' && symbol <= '9')
        return 1;
    return 0;
}

int isAlpha(char symbol)
{
    if (symbol >= 'a' && symbol <= 'z')
        return 1;
    if (symbol >= 'A' && symbol <= 'Z')
         return 1;
    if (symbol == '-')
         return 1;
    return 0;
}

void print(char *str)
{
    int c = 0;
    while (str[c] != NULL)
        CURR_CHAR = (int)(str[c++]);
}

int StringLen(char *str)
{
    int len = 0;
    while (str[len] != NULL)
        len++;
    return len;
}

int StringCmp(char *str0, char *str1)
{
    int i = 0;
    while (str0[i] != NULL && str1[i] != NULL)
    {
        if (str0[i] != str1[i])
            return 0;
        i++;
    }
    return (str0[i] == NULL && str1[i] == NULL);
}

int my_mul(int a, int b)
{
    volatile int res = 0;
    for (int i = 0; i < b; i++)
        res += a;
    return res;
}

int my_atoi(char **p)
{
    int val = 0;
    int digits_found = 0;
    while (**p == ' ') (*p)++;
    while (isNum(**p))
    {
        val = my_mul(val, 10) + (**p - '0');
        (*p)++;
        digits_found++;
    }
    return digits_found ? val : -1;
}

//---- COMMAND LOGIC ----

void SetCommand(int x, int y, int val)
{
    if (x < 0 || x >= FIELD_SIZE || y < 0 || y >= FIELD_SIZE)
    {
        print("Error: Coordinates out of bounds.\n");
        return;
    }
    if (val != 0 && val != 1)
    {
        print("Error: Value must be 0 or 1.\n");
        return;
    }
    CELL_ADR = x;
    LINE_ADR = y;
    VALUE = val;
    UPDATE = 1;
    UPDATE = 0;
}

void StartCmd()
{
    START_STOP = 1;
    print("Game started.\n");
}

void StopCmd()
{
    START_STOP = 0;
    print("Game stopped.\n");
}

void FillCmd(int *s, int *e, int val)
{
    if (s[0] < 0 || s[0] >= FIELD_SIZE || s[1] < 0 || s[1] >= FIELD_SIZE ||
        e[0] <= s[0] || e[0] > FIELD_SIZE || e[1] <= s[1] || e[1] > FIELD_SIZE)
    {
        print("Error: Invalid rectangle coordinates for fill.\n");
        return;
    }
    if (val != 0 && val != 1)
    {
        print("Error: Value must be 0 or 1.\n");
        return;
    }
    for (int i = s[0]; i <= e[0]; i++)
        for (int j = s[1]; j <= e[1]; j++)
            SetCommand(i, j, val);
    print("Fill complete.\n");
}

void CleanCmd()
{
    int s[] = {0, 0};
    int e[] = {FIELD_SIZE, FIELD_SIZE};
    FillCmd(s, e, 0);
    print("Field cleared.\n");
}

void HelpCmd(char *cmd)
{
    if (StringCmp(cmd, ""))
    {
        print("Available commands:\n");
        print(" set <x> <y> <val> - set cell (x,y) to val (0/1)\n");
        print(" rule <born> <sur> - set birth/survival rules (bitmask)\n");
        print(" stop - stop game\n");
        print(" start - start game\n");
        print(" fill <x1> <y1> <x2> <y2> <val> - fill rect (x1,y1)-(x2-1,y2-1)\n");
        print(" clean - clear field\n");
        print(" help [cmd] - show help\n");
        print(" set-glider <x> <y> - place a glider at (x,y)\n");
    }
    else if (StringCmp(cmd, "set"))
        print("Usage: set <x> <y> <val>\n Sets cell (x,y) to value (0 or 1).\n");
    else if (StringCmp(cmd, "rule"))
        print("Usage: rule <born> <sur>\n Sets Conway's Game of Life rules.\n");
    else if (StringCmp(cmd, "stop"))
        print("Usage: stop\n Stops the game simulation.\n");
    else if (StringCmp(cmd, "start"))
        print("Usage: start\n Starts/resumes the game simulation.\n");
    else if (StringCmp(cmd, "fill"))
        print("Usage: fill <x1> <y1> <x2> <y2> <val>\n Fills rectangle with value.\n");
    else if (StringCmp(cmd, "clean"))
        print("Usage: clean\n Clears the entire field.\n");
    else if (StringCmp(cmd, "help"))
        print("Usage: help [command]\n Shows general or command-specific help.\n");
    else if (StringCmp(cmd, "set-glider"))
        print("Usage: set-glider <x> <y>\n Places a standard glider.\n");
    else
    {
        print("Unknown command: '");
        print(cmd);
        print("'. Type 'help' for list.\n");
    }
}

void RuleCmd(int born, int sur)
{
    BORN = born;
    SURV = sur;
    print("Rules updated\n");
}

void RuleCmdWrapper(char *p)
{
    int born = my_atoi(&p);
    int sur = my_atoi(&p);
    if (born == -1 || sur == -1)
        print("Error: Invalid arguments for 'rule'. Usage: rule <born> <sur>\n");
    else
        RuleCmd(born, sur);
}

void SetGliderCmd(int x, int y)
{
    print("Placing glider...\n");
    SetCommand(x + 1, y, 1);
    SetCommand(x + 2, y + 1, 1);
    SetCommand(x, y + 2, 1);
    SetCommand(x + 1, y + 2, 1);
    SetCommand(x + 2, y + 2, 1);
}

void SetGliderCmdWrapper(char *p)
{
    int x = my_atoi(&p);
    int y = my_atoi(&p);
    if (x == -1 || y == -1)
        print("Error: Invalid arguments for 'set-glider'. Usage: set-glider <x> <y>\n");
    else
        SetGliderCmd(x, y);
}

void SetCmd(char *p)
{
    int x = my_atoi(&p);
    int y = my_atoi(&p);
    int val = my_atoi(&p);
    if (x == -1 || y == -1 || val == -1)
        print("Error: Invalid arguments for 'set'. Usage: set <x> <y> <val>\n");
    else
        SetCommand(x, y, val);
}

void FillCmdWrapper(char *p)
{
    int x1 = my_atoi(&p);
    int y1 = my_atoi(&p);
    int x2 = my_atoi(&p);
    int y2 = my_atoi(&p);
    int val = my_atoi(&p);
    if (x1 == -1 || y1 == -1 || x2 == -1 || y2 == -1 || val == -1)
        print("Error: Invalid arguments for 'fill'. Usage: fill <x1> <y1> <x2> <y2> <val>\n");
    else
    {
        int s[] = {x1, y1};
        int e[] = {x2, y2};
        FillCmd(s, e, val);
    }
}

//---- PARSE ----

void parse()
{
    char cmd_buffer[QSIZE * 2];
    char command[20];
    int len = 0;
    int i = 0;
    char *p;

    if (head == end) return;

    int current = head;
    while (current != end && len < QSIZE * 2 - 1)
    {
        cmd_buffer[len++] = (char)queue[current];
        current = (current + 1) % QSIZE;
    }
    cmd_buffer[len] = NULL;
    qInit();

    print(cmd_buffer);

    p = cmd_buffer;
    while (*p == ' ') p++;
    if (*p == NULL) return;

    i = 0;
    while (*p != ' ' && *p != NULL && i < 19)
        command[i++] = *p++;
    command[i] = NULL;
    while (*p == ' ') p++;

    if (StringCmp(command, "set"))
        SetCmd(p);
    else if (StringCmp(command, "rule"))
        RuleCmdWrapper(p);
    else if (StringCmp(command, "stop"))
        StopCmd();
    else if (StringCmp(command, "start"))
        StartCmd();
    else if (StringCmp(command, "fill"))
        FillCmdWrapper(p);
    else if (StringCmp(command, "clean"))
        CleanCmd();
    else if (StringCmp(command, "help"))
        HelpCmd(p);
    else if (StringCmp(command, "set-glider"))
        SetGliderCmdWrapper(p);
    else
    {
        print("Error: Unknown command '");
        print(command);
        print("'. Type 'help'.\n");
    }
}

int main()
{
    print("in main\n");
    parse();
}