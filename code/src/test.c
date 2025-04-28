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

//---- GLOBAL VARIABLES ----

volatile char queue[QSIZE];
volatile int head;
volatile int end;
volatile int gmState = 0;

//---- STRING FUNCTIONS ----

int isNum(char symbol)
{
    return (symbol >= '0' && symbol <= '9');
}

int isAlpha(char symbol)
{
    return ((symbol >= 'a' && symbol <= 'z') || (symbol >= 'A' && symbol <= 'Z') || (symbol == '-'));
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

int StringTrimRight(char *str)
{
    int len = StringLen(str);
    while (len > 0 && (str[len - 1] == ' ' || str[len - 1] == '\n' || str[len - 1] == '\t'))
        str[--len] = NULL;
    return len;
}

int parseArgs(char *p, char *args[], int max_args)
{
    int count = 0;
    while (*p && count < max_args)
    {
        while (*p == ' ') p++;
        if (*p == NULL) break;
        args[count++] = p;
        while (*p != ' ' && *p != NULL) p++;
        if (*p != NULL) *p++ = NULL;
    }
    return count;
}

int my_atoi_safe(char *str, int *out)
{
    int val = 0;
    int found = 0;
    while (*str == ' ') str++;
    if (!isNum(*str)) return 0;
    while (isNum(*str))
    {
        val = my_mul(val, 10) + (*str - '0');
        str++;
        found = 1;
    }
    *out = val;
    return found;
}

int pow2(int n)
{
    int result = 1;
    for (int i = 1; i < n; i++)
        result = result + result;
    return result;
}

int parseRuleArg(char *p)
{
    int result = 0;
    while (*p)
    {
        if (isNum(*p))
        {
            int bit = *p - '0';
            if (bit >= 0 && bit <= 8)
                result = result + pow2(bit);
        }
        p++;
    }
    return result;
}

//---- QUEUE FUNCTIONS ----

void qInit()
{
    for (int i = 0; i < QSIZE; i++)
        queue[i] = 0;
    head = 0;
    end = 0;
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
}

void StartCmdWrapper()
{
    START_STOP = 1;
    gmState = 1;
    print("Game started.\n");
}

void StopCmdWrapper()
{
    START_STOP = 0;
    gmState = 0;
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

    START_STOP = 0;

    for (int i = s[0]; i <= e[0]; i++)
    {
        for (int j = s[1]; j <= e[1]; j++)
        {
            CELL_ADR = j;
            LINE_ADR = i;
            VALUE = val;
            UPDATE = 1;
        }
    }
    
    START_STOP = gmState;

    print("Fill complete.\n");
}

void CleanCmd()
{
    int s[] = {0, 0};
    int e[] = {FIELD_SIZE - 1, FIELD_SIZE - 1};
    FillCmd(s, e, 0);
    print("Field cleared.\n");
}

void RuleCmdWrapper(char *p)
{
    char *args[2];
    int count = parseArgs(p, args, 2);
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'rule'. Usage: rule b<digits> s<digits>\n");
        return;
    }

    if (args[0][0] != 'b' || args[1][0] != 's')
    {
        print("Error: Invalid format for 'rule'. Must be 'b<digits> s<digits>'.\n");
        return;
    }

    BORN = parseRuleArg(args[0] + 1);
    SURV = parseRuleArg(args[1] + 1);
    print("Rules updated\n");
}

void SetCmdWrapper(char *p)
{
    char *args[3];
    int count = parseArgs(p, args, 3);

    if (count != 3)
    {
        print("Error: Invalid number of arguments for 'set'. Usage: set <x> <y> <val>\n");
        return;
    }

    int x, y, val;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y) || !my_atoi_safe(args[2], &val))
    {
        print("Error: Invalid arguments for 'set'.\n");
        return;
    }
    SetCommand(x, y, val);
}

void FillCmdWrapper(char *p)
{
    char *args[5];
    int count = parseArgs(p, args, 5);
    if (count != 5)
    {
        print("Error: Invalid number of arguments for 'fill'. Usage: fill <x1> <y1> <x2> <y2> <val>\n");
        return;
    }

    int x1, y1, x2, y2, val;
    if (!my_atoi_safe(args[0], &x1) || !my_atoi_safe(args[1], &y1) ||
        !my_atoi_safe(args[2], &x2) || !my_atoi_safe(args[3], &y2) ||
        !my_atoi_safe(args[4], &val))
    {
        print("Error: Invalid arguments for 'fill'.\n");
        return;
    }

    int s[] = {x1, y1};
    int e[] = {x2, y2};
    FillCmd(s, e, val);
}

void SetGliderCmd(int x, int y)
{
    START_STOP = 0;

    print("Placing glider...\n");
    SetCommand((x + 1) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);
    SetCommand(x % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);
    SetCommand((x + 1) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);

    START_STOP = gmState;
}

void SetGliderCmdWrapper(char *p)
{
    char *args[2];
    int count = parseArgs(p, args, 2);
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'set-glider'. Usage: set-glider <x> <y>\n");
        return;
    }

    int x, y;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y))
    {
        print("Error: Invalid arguments for 'set-glider'.\n");
        return;
    }
    SetGliderCmd(x, y);
}

void HelpCmd(char *cmd)
{
    StringTrimRight(cmd);

    if (StringCmp(cmd, ""))
    {
        print("Available commands:\n");
        print(" set <x> <y> <val> - set cell (x,y) to val (0/1)\n");
        print(" rule b<digits> s<digits> - set birth/survival rules\n");
        print(" stop - stop game\n");
        print(" start - start game\n");
        print(" fill <x1> <y1> <x2> <y2> <val> - fill rect (x1,y1)-(x2,y2)\n");
        print(" clean - clear field\n");
        print(" help [cmd] - show help\n");
        print(" set-glider <x> <y> - place a glider\n");
    }
    else if (StringCmp(cmd, "set"))
        print("Usage: set <x> <y> <val>\n Sets cell (x,y) to 0 or 1.\n");
    else if (StringCmp(cmd, "rule"))
        print("Usage: rule b<digits> s<digits>\n Sets birth and survival rules.\n");
    else if (StringCmp(cmd, "stop"))
        print("Usage: stop\n Stops the simulation.\n");
    else if (StringCmp(cmd, "start"))
        print("Usage: start\n Starts the simulation.\n");
    else if (StringCmp(cmd, "fill"))
        print("Usage: fill <x1> <y1> <x2> <y2> <val>\n Fill a rectangle.\n");
    else if (StringCmp(cmd, "clean"))
        print("Usage: clean\n Clears the field.\n");
    else if (StringCmp(cmd, "set-glider"))
        print("Usage: set-glider <x> <y>\n Place a glider at (x,y).\n");
    else
    {
        print("Unknown command: '");
        print(cmd);
        print("'. Type 'help' for list.\n");
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
        cmd_buffer[len++] = queue[current];
        current = (current + 1) % QSIZE;
    }
    cmd_buffer[len] = NULL;
    qInit();

    print(cmd_buffer);
    print("\n");

    p = cmd_buffer;
    while (*p == ' ') p++;
    if (*p == NULL) return;

    i = 0;
    while (*p != ' ' && *p != NULL && i < 19)
        command[i++] = *p++;
    command[i] = NULL;
    while (*p == ' ') p++;

    if (StringCmp(command, "set"))
        SetCmdWrapper(p);
    else if (StringCmp(command, "rule"))
        RuleCmdWrapper(p);
    else if (StringCmp(command, "stop"))
        StopCmdWrapper();
    else if (StringCmp(command, "start"))
        StartCmdWrapper();
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
    print("> ");
}

int main()
{
    parse();
}
