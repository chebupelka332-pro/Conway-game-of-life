#define QSIZE 32
#define FIELD_SIZE 32
#define NULL 0

extern int ISTATE;
extern int CURR_CHAR;
extern int UPDATE;
extern int START_STOP;
extern int BORN;
extern int SURV;
extern int LINE_ADR;
extern int CELL_ADR;
extern int VALUE;

extern char *len_error;

int queue[QSIZE];
int head;
int end;


/*int strcmp(char *str0, char *str1); // 1 - если равны, 0 - если не равны

int strlen(char *str); // длина строки */

void qInit()
{
    for (int i = 0; i < QSIZE; i++)
        queue[i] = 0;
    
    head = 0;
    end = 0;
}

//void qClear();

void qPush(char symbol)
{
    queue[end] = (int)symbol;
    end = (end + 1) % QSIZE;
    
    if (end == head)
        head = (head + 1) % QSIZE;
}

char qPop()
{
    if (head == end) return NULL;

    char res = queue[head];
    head = (head + 1) % QSIZE;
    return res;
}

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

    return 0;
}

void setCommand(int x, int y, int val)
{
    CELL_ADR = x;
    LINE_ADR = y;
    VALUE = val;
    UPDATE = 1;
    UPDATE = 0;
}

void startCommand()
{
    START_STOP = 1;
}

void stopCommand()
{
    START_STOP = 0;
}

void fillCommand(int *start, int *end, int val)
{
    for (int i = start[0]; i < end[0]; i++)
    {
        for (int j = start[1]; j < end[1]; j++)
        {
            setCommand(i, j, val);
        }
    }
}

void cleanCommand()
{
    int start[] = {0, 0};
    int end[] = {FIELD_SIZE, FIELD_SIZE};
    fillCommand(start, end, 0);
}

void help()
{
    char someTetx[] = "Help text )))\n\0";
    int c = 0;
    while (someTetx[c])
    {
        CURR_CHAR = (int)(someTetx[c++]);
    }
}

void ruleCommand(int born, int sur)
{
    BORN = born;
    SURV = sur;
}



int main()
{
    /*ruleCommand(0b00000100, 0b00000110);

    setCommand(1, 0, 1);
    setCommand(2, 1, 1);

    int s[] = {0, 2};
    int e[] = {3, 3};
    fillCommand(s, e, 1);

    startCommand();*/
    
    qInit();
    ISTATE = 1; // Set interupt flag to 1
    while (1)
    {
        1+1;
    }

    return 0;
}