//---- DEFINES ----

#define QSIZE 32
#define FIELD_SIZE 32
#define NULL '\0'
#define MAX_CMD_ARGS 10 // The maximum number of arguments that parse Args can parse

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
volatile extern int RESET;

//---- GLOBAL VARIABLES ----

volatile char queue[QSIZE];
volatile int head;
volatile int end;
volatile int gmState = 0;

//---- HELP STRINGS ----

char mainHelp[] = "Available commands:\n"
                  " set <x> <y> <val>      - Set cell (x,y) to val (0 or 1)\n"
                  " rule b<nums> s<nums>   - Set B/S rules (e.g., rule b3 s23)\n"
                  " stop                   - Stop the simulation\n"
                  " start                  - Start the simulation\n"
                  " fill <x1> <y1> <x2> <y2> <val> - Fill rectangle (inclusive)\n"
                  " clean                  - Clear the entire field (fill with 0)\n"
                  " set-glider <x> <y>     - Place a glider at top-left (x,y)\n"
                  " set-bee-queen <x> <y>  - Place a 'bee-queen' at top-left (x,y)\n"
                  " set-lwss <x> <y>       - Place a light-weight spaceship at top-left (x,y)\n"
                  " set-hwss <x> <y>       - Place a heavy-weight spaceship at top-left (x,y)\n"
                  " help [command]         - Show this help or help for a command\n";
char setHelp[] = "Usage: set <x> <y> <val>\n"
                 " Sets the cell at coordinates (x,y) to the specified value\n"
                 " (0 for dead, 1 for alive). Coordinates are 0-indexed [0-31].\n";
char stopHelp[] = "Usage: stop\n"
                  " Stops the simulation from advancing to the next generation.\n";
char startHelp[] = "Usage: start\n"
                   " Starts or resumes the simulation, advancing generations according to the current rules.\n";
char fillHelp[] = "Usage: fill <x1> <y1> <x2> <y2> <val>\n"
                  " Fills a rectangular area with the specified value (0 or 1).\n"
                  " (x1,y1) is the top-left corner, (x2,y2) is the bottom-right corner (inclusive).\n"
                  " Requires x1 <= x2 and y1 <= y2, and coordinates within [0-31].\n";
char cleanHelp[] = "Usage: clean\n"
                   " Clears the entire field by setting all cells to 0 (dead).\n"
                   " Equivalent to 'fill 0 0 31 31 0'.\n";
char ruleHelp[] = "Usage: rule b<digits> s<digits>\n"
                  " Sets the Birth and Survival rules for Conway's Game of Life.\n"
                  " <digits> are the numbers of neighbours required (0-8).\n"
                  " Example: 'rule b3 s23' (standard Conway rules).\n"
                  " Digits can be repeated or out of order (e.g., b331 is same as b13).\n";
char setGliderHelp[] = "Usage: set-glider <x> <y>\n"
                       " Places a standard glider pattern with its top-left bounding box corner\n"
                       " at (x,y) [0-31]. The pattern wraps around the edges if necessary.\n"
                       " Pattern:\n"
                       "   .X.\n"
                       "   ..X\n"
                       "   XXX\n";
char setBeeQueenHelp[] = "Usage: set-bee-queen <x> <y>\n"
                         " Places a 'bee-queen' pattern with its top-left bounding box corner\n"
                         " at (x,y) [0-31]. Pattern:\n"
                         "   XX..\n"
                         "   ..X.\n"
                         "   ...X\n"
                         "   ...X\n"
                         "   ...X\n"
                         "   ..X.\n"
                         "   XX..\n";
char setLWSSHelp[] = "Usage: set-lwss <x> <y>\n"
                     " Places a light-weight spaceship pattern with its top-left bounding box corner\n"
                     " at (x,y) [0-31]. Pattern:\n"
                     "   .XXXX\n"
                     "   X...X\n"
                     "   ....X\n"
                     "   X..X\n";
char setHWSSHelp[] = "Usage: set-hwss <x> <y>\n"
                     " Places a heavy-weight spaceship pattern with its top-left bounding box corner\n"
                     " at (x,y) [0-31]. Pattern:\n"
                     "   ..XX...\n"
                     "   X....X.\n"
                     "   ......X\n"
                     "   X.....X\n"
                     "   .XXXXXX\n";
char helpHelp[] = "Usage: help [command]\n"
                  " Shows general help (if no command specified)\n"
                  " or specific help for the given [command].\n";

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

void clearBuffer(volatile int buffer[], int n)
{
    for (int i = 0; i < n; i++)
        buffer[i] = 0;
}

int parseArgs(char *p, char *args[], int args_capacity)
{
    int count = 0;
    while (*p && count < args_capacity)
    {
        while (*p == ' ') p++;
        if (*p == NULL) break;
        args[count++] = p;
        while (*p != ' ' && *p != NULL) p++;
        if (*p == ' ') *p++ = NULL; // If found a space, replace it with NULL and go to the next symbol
    }
    while (*p == ' ') p++;
    if (*p != NULL && count < args_capacity) 
    {
        // If there are still non-whitespace characters, this is considered an extra argument,
        // even if it does not fit into the args array. We increase count so that checking 
        // for the exact number of arguments in the calling function works.
        count++;
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
        if (val > (32767 / 10)) return 0;
        val = my_mul(val, 10) + (*str - '0');
        str++;
        found = 1;
    }

    while (*str == ' ') str++;
    if (*str != NULL) return 0; // If there is anything left after the number and spaces, the argument is invalid.

    *out = val;
    return found;
}


int pow2(int n)
{
    int result = 1;
    for (int i = 0; i < n; i++)
        result = result + result;
    return result;
}

int parseRuleArg(char *p)
{
    int result = 0;
    volatile int seen[9]; // An array for tracking already added bits
    clearBuffer(seen, 9);

    while (*p)
    {
        if (isNum(*p))
        {
            int bit = *p - '0';
            if (bit >= 0 && bit <= 8)
            {
                if (!seen[bit]) 
                {
                    result = result + pow2(bit);
                    seen[bit] = 1; // Mark a bit as seen
                } 
            } 
            else 
            {
                print("Error: Rule digits must be between 0 and 8.\n");
                return -1;
            }
        } 
        else if (*p != ' ' && *p != '\t') 
        {
             // Invalid character in the rule line
             print("Error: Invalid character in rule argument.\n");
             return -1;
        }
        p++;
    }

    if (result == 0 && !seen[0]) 
    {
        int isEmpty = 1;
        for(int i=0; i<=8; ++i)
        {
            if (seen[i]) 
            {
                isEmpty = 0;
                break;
            }
        }
        if (isEmpty) 
        {
             print("Error: Rule argument cannot be empty.\n");
             return -1;
        }
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
        print("Error: Coordinates out of bounds [0-31].\n");;
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

void StartCmdWrapper(char *args[], int count)
{
    if (count != 0) 
    {
        print("Error: 'start' command takes no arguments.\n");
        return;
    }
    START_STOP = 1;
    gmState = 1;
    print("Game started.\n");
}

void StopCmdWrapper(char *args[], int count)
{
    if (count != 0) 
    {
        print("Error: 'stop' command takes no arguments.\n");
        return;
    }
    START_STOP = 0;
    gmState = 0;
    print("Game stopped.\n");
}

void FillCmd(int *s, int *e, int val)
{

    if (s[0] < 0 || s[0] >= FIELD_SIZE || s[1] < 0 || s[1] >= FIELD_SIZE ||
        e[0] < s[0] || e[0] >= FIELD_SIZE || e[1] < s[1] || e[1] >= FIELD_SIZE)
    {
        print("Error: Invalid rectangle coordinates for fill.\n");
        print(" Usage: fill <x1> <y1> <x2> <y2> <val> where x1<=x2, y1<=y2.\n");
        return;
    }
    if (val != 0 && val != 1)
    {
        print("Error: Value must be 0 or 1.\n");
        return;
    }

    START_STOP = 0;

    for (int i = s[1]; i <= e[1]; i++)
    {
        for (int j = s[0]; j <= e[0]; j++)
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

void CleanCmdWrapper(char *args[], int count)
{
    if (count != 0) 
    {
        print("Error: 'clean' command takes no arguments.\n");
        return;
    }
    RESET = 1;
    print("Field cleaned.\n");
}

void RuleCmdWrapper(char *args[], int count)
{
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'rule'.\n Usage: rule b<digits> s<digits>\n");
        return;
    }

    if (args[0][0] != 'b' || args[1][0] != 's' || !isNum(args[0][1]) || !isNum(args[1][1]) )
    {
        print("Error: Invalid format for 'rule'.\n Must be 'b<digits> s<digits>'.\n");
        return;
    }

    int born_rule = parseRuleArg(args[0] + 1);
    int surv_rule = parseRuleArg(args[1] + 1);

    if (born_rule == -1 || surv_rule == -1) return;

    BORN = born_rule;
    SURV = surv_rule;
    print("Rules updated.\n");
}

void SetCmdWrapper(char *args[], int count)
{
    if (count != 3)
    {
        print("Error: Invalid number of arguments for 'set'.\n Usage: set <x> <y> <val>\n");
        return;
    }

    int x, y, val;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y) || !my_atoi_safe(args[2], &val))
    {
        print("Error: Invalid arguments for 'set'.\n Ensure x, y, val are valid integers.\n");
        return;
    }

    SetCommand(x, y, val);
}

void FillCmdWrapper(char *args[], int count)
{
    if (count != 5)
    {
        print("Error: Invalid number of arguments for 'fill'.\n Usage: fill <x1> <y1> <x2> <y2> <val>\n");
        return;
    }

    int x1, y1, x2, y2, val;
    if (!my_atoi_safe(args[0], &x1) || !my_atoi_safe(args[1], &y1) ||
        !my_atoi_safe(args[2], &x2) || !my_atoi_safe(args[3], &y2) ||
        !my_atoi_safe(args[4], &val))
    {
        print("Error: Invalid arguments for 'fill'.\n Ensure coordinates and value are valid integers.\n");
        return;
    }

    int s[] = {x1, y1};
    int e[] = {x2, y2};
    FillCmd(s, e, val);
}

void SetGliderCmd(int x, int y)
{
    START_STOP = 0;
    
    if (x < 0 || x > 31 || y < 0 || y > 31)
    {
        print("Error: Coordinates out of bounds [0-31].\n");
        return;
    }

    print("Placing glider...\n");
    SetCommand((x + 1) % FIELD_SIZE, y % FIELD_SIZE, 1);           // .*.
    SetCommand((x + 2) % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);     // ..*
    SetCommand(x % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);           // ***
    SetCommand((x + 1) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);

    START_STOP = gmState;

    print("Glider placed.\n");
}

void SetGliderCmdWrapper(char *args[], int count)
{
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'set-glider'.\n Usage: set-glider <x> <y>\n");
        return;
    }

    int x, y;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y))
    {
        print("Error: Invalid arguments for 'set-glider'.\n Ensure x and y are valid integers.\n");
        return;
    }
    SetGliderCmd(x, y);
}

void SetBeeQueenCmd(int x, int y)
{
    START_STOP = 0;
    
    if (x < 0 || x > 31 || y < 0 || y > 31)
    {
        print("Error: Coordinates out of bounds [0-31].\n");
        return;
    }

    //**..
    //..*.
    //...*
    //...*
    //...*
    //..*.
    //**..
    print("Placing bee queen...\n");
    SetCommand(x % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 1) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, (y + 3) % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, (y + 5) % FIELD_SIZE, 1);
    SetCommand(x % FIELD_SIZE, (y + 6) % FIELD_SIZE, 1);
    SetCommand((x + 1) % FIELD_SIZE, (y + 6) % FIELD_SIZE, 1);

    START_STOP = gmState;

    print("Bee queen placed.\n");
}

void SetBeeQueenCmdWrapper(char *args[], int count)
{
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'set-bee-queen'.\n Usage: set-bee-queen <x> <y>\n");
        return;
    }

    int x, y;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y))
    {
        print("Error: Invalid arguments for 'set-bee-queen'.\n Ensure x and y are valid integers.\n");
        return;
    }
    SetBeeQueenCmd(x, y);
}

void SetLWSSCmd(int x, int y)
{
    START_STOP = 0;
    
    if (x < 0 || x > 31 || y < 0 || y > 31)
    {
        print("Error: Coordinates out of bounds [0-31].\n");
        return;
    }

    //.****
    //*...*
    //....*
    //*..*

    print("Placing light-weight spaceship...\n");
    SetCommand((x + 1) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 4) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand(x % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);
    SetCommand((x + 4) % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);
    SetCommand((x + 4) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);
    SetCommand(x % FIELD_SIZE, (y + 3) % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, (y + 3) % FIELD_SIZE, 1);

    START_STOP = gmState;

    print("Light-weight spaceship placed.\n");
}

void SetLWSSCmdWrapper(char *args[], int count)
{
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'set-lwss'.\n Usage: set-lwss <x> <y>\n");
        return;
    }

    int x, y;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y))
    {
        print("Error: Invalid arguments for 'set-lwss'.\n Ensure x and y are valid integers.\n");
        return;
    }
    SetLWSSCmd(x, y);
}

void SetHWSSCmd(int x, int y)
{
    START_STOP = 0;
    
    if (x < 0 || x > 31 || y < 0 || y > 31)
    {
        print("Error: Coordinates out of bounds [0-31].\n");
        return;
    }

    //..**...
    //*....*.
    //......*
    //*.....*
    //.******

    print("Placing heavy-weight spaceship...\n");
    SetCommand((x + 2) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, y % FIELD_SIZE, 1);
    SetCommand(x % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);
    SetCommand((x + 5) % FIELD_SIZE, (y + 1) % FIELD_SIZE, 1);
    SetCommand((x + 6) % FIELD_SIZE, (y + 2) % FIELD_SIZE, 1);
    SetCommand(x % FIELD_SIZE, (y + 3) % FIELD_SIZE, 1);
    SetCommand((x + 6) % FIELD_SIZE, (y + 3) % FIELD_SIZE, 1);
    SetCommand((x + 1) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);
    SetCommand((x + 2) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);
    SetCommand((x + 3) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);
    SetCommand((x + 4) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);
    SetCommand((x + 5) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);
    SetCommand((x + 6) % FIELD_SIZE, (y + 4) % FIELD_SIZE, 1);

    START_STOP = gmState;

    print("Heavy-weight spaceship placed.\n");
}

void SetHWSSCmdWrapper(char *args[], int count)
{
    if (count != 2)
    {
        print("Error: Invalid number of arguments for 'set-hwss'.\n Usage: set-hwss <x> <y>\n");
        return;
    }

    int x, y;
    if (!my_atoi_safe(args[0], &x) || !my_atoi_safe(args[1], &y))
    {
        print("Error: Invalid arguments for 'set-hwss'.\n Ensure x and y are valid integers.\n");
        return;
    }
    SetHWSSCmd(x, y);
}

void HelpCmdWrapper(char *args[], int count)
{
    if (count == 0)
    {
        print(mainHelp);
    }
    else if (count == 1)
    {
        char *cmd = args[0];

        if (StringCmp(cmd, "set"))
            print(setHelp);
        else if (StringCmp(cmd, "stop"))
            print(stopHelp);
        else if (StringCmp(cmd, "start"))
            print(startHelp);
        else if (StringCmp(cmd, "fill"))
            print(fillHelp);
        else if (StringCmp(cmd, "clean"))
            print(cleanHelp);
        else if (StringCmp(cmd, "rule"))
            print(ruleHelp);
        else if (StringCmp(cmd, "set-glider"))
            print(setGliderHelp);
        else if (StringCmp(cmd, "set-bee-queen"))
            print(setBeeQueenHelp);
        else if (StringCmp(cmd, "set-lwss"))
            print(setLWSSHelp);
        else if (StringCmp(cmd, "set-hwss"))
            print(setHWSSHelp);
        else if (StringCmp(cmd, "help"))
            print(helpHelp);
        else
        {
            print("Error: Unknown command '");
            print(cmd);
            print("' for help. Type 'help' for a list of commands.\n");
        }
    }
    else
    {
        print("Error: Too many arguments for 'help'.\n");
        print(" Usage: help [command]\n");
    }
}

//---- PARSE ----

void parse()
{
    char cmd_buffer[QSIZE + 1]; // Buffer for commands from queue (+1 for NULL)
    char command[QSIZE + 1];    // Buffer for the command name
    char *args[MAX_CMD_ARGS];   // Array for pointers to arguments
    int arg_count = 0;          // Number of arguments found
    int len = 0;
    int i = 0;
    char *p;

    if (head == end) return; // Queue is empty

    // Reading a command from a queue in cmd_buffer
    int current = head;
    while (current != end && len < QSIZE)
    {
        if (queue[current] == '\0') 
        {
            end = (current + 1) % QSIZE; 
            break;
        }
        cmd_buffer[len++] = queue[current];
        current = (current + 1) % QSIZE;
    }
    cmd_buffer[len] = NULL;

    qInit();

    p = cmd_buffer;
    while (*p == ' ') p++; // Skip leading spaces
    if (*p == NULL) 
    {
        print("> ");
        return;
    }

    // Extracting the command name
    i = 0;
    while (*p != ' ' && *p != NULL && i < QSIZE)
        command[i++] = *p++;
    command[i] = NULL;

    while (*p == ' ') p++;

    // Parsing arguments (p points to the line after the command name)
    arg_count = parseArgs(p, args, MAX_CMD_ARGS);

    if (StringCmp(command, "set"))
        SetCmdWrapper(args, arg_count);
    else if (StringCmp(command, "rule"))
        RuleCmdWrapper(args, arg_count);
    else if (StringCmp(command, "stop"))
        StopCmdWrapper(args, arg_count);
    else if (StringCmp(command, "start"))
        StartCmdWrapper(args, arg_count);
    else if (StringCmp(command, "fill"))
        FillCmdWrapper(args, arg_count);
    else if (StringCmp(command, "clean"))
        CleanCmdWrapper(args, arg_count);
    else if (StringCmp(command, "help"))
        HelpCmdWrapper(args, arg_count);
    else if (StringCmp(command, "set-glider"))
        SetGliderCmdWrapper(args, arg_count);
    else if (StringCmp(command, "set-bee-queen"))
        SetBeeQueenCmdWrapper(args, arg_count);
    else if (StringCmp(command, "set-lwss"))
        SetLWSSCmdWrapper(args, arg_count);
    else if (StringCmp(command, "set-hwss"))
        SetHWSSCmdWrapper(args, arg_count);
    else
    {
        print("Error: Unknown command '");
        print(command);
        print("'. Type 'help'.\n");
    }
    print("> "); // Prompt to enter the following command
}

int main()
{
    parse();
}