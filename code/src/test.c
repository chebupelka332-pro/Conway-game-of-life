//---- DEFINES ----
#define QSIZE 32
#define FIELD_SIZE 32
#define NULL '\0' // Использовать '\0' для конца строки

//---- EXTERNAL VARIABLES ----
// Предполагается, что эти переменные определены где-то еще
// и используются для взаимодействия с основной логикой игры/отображения
extern int ISTATE;      // Флаг прерывания (не используется в предоставленном коде)
extern int CURR_CHAR;   // Текущий символ для вывода (используется в print)
extern int UPDATE;      // Флаг для обновления ячейки
extern int START_STOP;  // Флаг для старта/остановки игры (1 - старт, 0 - стоп)
extern int BORN;        // Правило рождения (битовая маска соседей)
extern int SURV;        // Правило выживания (битовая маска соседей)
extern int LINE_ADR;    // Адрес строки (Y) для обновления ячейки
extern int CELL_ADR;    // Адрес столбца (X) для обновления ячейки
extern int VALUE;       // Значение (0 или 1) для обновления ячейки

extern char *len_error; // Сообщение об ошибке (не используется)

//---- QUEUE VARIABLES ----
int queue[QSIZE];
int head;
int end;


//---- QUEUE FUNCTIONS ----
void qInit()
{
    for (int i = 0; i < QSIZE; i++)
        queue[i] = 0;

    head = 0;
    end = 0;
}

//void qClear(); // Не реализована, можно использовать qInit()

void qPush(char symbol)
{
    queue[end] = (int)symbol;
    end = (end + 1) % QSIZE;

    // Если очередь переполнилась, сдвигаем начало (теряем старые данные)
    if (end == head)
        head = (head + 1) % QSIZE;
}

char qPop()
{
    if (head == end) return NULL; // Возвращаем '\0', если пусто

    char res = (char)queue[head];
    queue[head] = 0; // Очищаем ячейку (не обязательно, но полезно)
    head = (head + 1) % QSIZE;
    return res;
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
    // Учитываем только строчные буквы согласно исходной функции
    if (symbol >= 'a' && symbol <= 'z')
        return 1;
    // Можно добавить заглавные буквы и дефис для 'set-glider'
    if (symbol >= 'A' && symbol <= 'Z')
         return 1;
    if (symbol == '-')
         return 1;
    return 0;
}

// Функция вывода строки через CURR_CHAR
void print(char *str)
{
    int c = 0;
    while (str[c] != NULL) // Используем NULL ('\0')
    {
        // Предполагается, что присвоение CURR_CHAR вызывает
        // механизм вывода символа (например, через прерывание или опрос)
        CURR_CHAR = (int)(str[c++]);
        // Здесь может потребоваться небольшая задержка или проверка флага,
        // что символ был выведен, в зависимости от реализации CURR_CHAR.
    }
}

// Реализация strlen согласно заданию
int strlen(char *str)
{
    int len = 0;
    while (str[len] != NULL) // Идем до '\0'
    {
        len++;
    }
    return len;
}

// Реализация strcmp согласно заданию (1 - равны, 0 - не равны)
int strcmp(char *str0, char *str1)
{
    int i = 0;
    // Сравниваем символы, пока не дойдем до конца одной из строк
    while (str0[i] != NULL && str1[i] != NULL)
    {
        if (str0[i] != str1[i])
        {
            return 0; // Символы не совпали - строки не равны
        }
        i++;
    }
    // Если обе строки закончились одновременно (символы '\0'), они равны
    if (str0[i] == NULL && str1[i] == NULL)
    {
        return 1; // Строки равны
    }
    // Если одна строка закончилась, а другая нет - они не равны
    return 0;
}

// Вспомогательная функция для парсинга числа из строки
// Обновляет указатель p, чтобы он указывал на символ после числа
// Возвращает -1 в случае ошибки (не найдено число)
int my_atoi(char **p) {
    int val = 0;
    int sign = 1;
    int digits_found = 0;

    // Пропускаем пробелы
    while (**p == ' ') (*p)++;

    // Проверяем знак (необязательно по ТЗ, но полезно)
    if (**p == '-') {
        sign = -1;
        (*p)++;
    } else if (**p == '+') {
        (*p)++;
    }

    // Читаем цифры
    while (isNum(**p)) {
        val = val * 10 + (**p - '0');
        (*p)++;
        digits_found = 1;
    }

    if (!digits_found) return -1; // Ошибка: цифр не найдено

    return val * sign;
}


//---- COMMAND LIST FUNCTIONS ----

// Обёртка для вызова внешних команд обновления ячейки
void SetCommand(int x, int y, int val)
{
    // Проверка границ (важно!)
    if (x < 0 || x >= FIELD_SIZE || y < 0 || y >= FIELD_SIZE) {
        print("Error: Coordinates out of bounds.\n");
        return;
    }
     if (val != 0 && val != 1) {
        print("Error: Value must be 0 or 1.\n");
        return;
    }

    CELL_ADR = x;
    LINE_ADR = y;
    VALUE = val;
    UPDATE = 1; // Установить флаг
    // Сброс флага должен происходить во внешней логике после обработки
    // UPDATE = 0; // Обычно это делает та часть системы, которая читает UPDATE
}

// Команда старта игры
void StartCmd()
{
    START_STOP = 1;
    print("Game started.\n");
}

// Команда остановки игры
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
    {
        for (int j = s[1]; j <= e[1]; j++)
        {
            SetCommand(i, j, val);
        }
    }
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
    if (strcmp(cmd, "") == 1)
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
    else
    {
        if (strcmp(cmd, "set"))
            print("Usage: set <x> <y> <val>\n Sets cell (x,y) to value (0 or 1).\n");
        else if (strcmp(cmd, "rule"))
            print("Usage: rule <born> <sur>\n Sets Conway's Game of Life rules.\n <born>: bitmask of neighbour counts for cell birth (e.g., 8 for 3 neighbours).\n <sur>: bitmask of neighbour counts for survival (e.g., 12 for 2 or 3 neighbours).\n");
        else if (strcmp(cmd, "stop"))
            print("Usage: stop\n Stops the game simulation.\n");
        else if (strcmp(cmd, "start"))
            print("Usage: start\n Starts/resumes the game simulation.\n");
        else if (strcmp(cmd, "fill"))
            print("Usage: fill <x1> <y1> <x2> <y2> <val>\n Fills the rectangle from (x1, y1) to (x2-1, y2-1) with value (0 or 1).\n");
        else if (strcmp(cmd, "clean"))
            print("Usage: clean\n Clears the entire field (sets all cells to 0).\n");
        else if (strcmp(cmd, "help"))
            print("Usage: help [command]\n Shows general help or help for a specific command.\n");
        else if (strcmp(cmd, "set-glider"))
            print("Usage: set-glider <x> <y>\n Places a standard 5-cell glider pattern with top-left corner near (x,y).\n");
        else 
        {
            print("Unknown command: '");
            print(cmd);
            print("'. Type 'help' for list.\n");
        }
    }
}

void RuleCmd(int born, int sur)
{
    BORN = born;
    SURV = sur;
    print("Rules updated");
}

void SetGliderCmd(int x, int y)
{
    print("Placing glider...\n");
    // Стандартный глайдер 5 ячеек:
    // .O.
    // ..O
    // OOO
    // Координаты относительно (x, y) как верхнего левого угла "описанного" прямоугольника 3x3
    SetCommand(x + 1, y, 1);
    SetCommand(x + 2, y + 1, 1);
    SetCommand(x, y + 2, 1);
    SetCommand(x + 1, y + 2, 1);
    SetCommand(x + 2, y + 2, 1);
}
//--------

void parse()
{
    char cmd_buffer[QSIZE * 2];
    char command[20];
    int len = 0;
    int i = 0;
    char *p;

    // Есть ли что парсить?
    if (head == end) return;

    // Копированмие данных из циклической очереди в линейный буфер
    int current = head;
    while (current != end) 
    {
        if (len < (QSIZE * 2 - 1)) 
            cmd_buffer[len++] = (char)queue[current];
        current = (current + 1) % QSIZE;
    }
    cmd_buffer[len] = NULL;
    // Очистить очередь (т.к. команда скопирована)
    qInit();

    // Парсинг
    p = cmd_buffer;

    // Пропускаем ведущие пробелы
    while (*p == ' ') p++;
    if (*p == NULL) return;

    // Считываем имя команды
    i = 0;
    while (*p != ' ' && *p != NULL && i < 19) 
    {
        command[i++] = *p;
        p++;
    }
    command[i] = NULL;

    // Обработка команды
    if (strcmp(command, "set") == 1) 
    {
        int x = my_atoi(&p);
        int y = my_atoi(&p);
        int val = my_atoi(&p);
        if (x == -1 || y == -1 || val == -1) 
            print("Error: Invalid arguments for 'set'. Usage: set <x> <y> <val>\n");
        else 
            SetCommand(x, y, val); 
    } 
    else if (strcmp(command, "rule") == 1) 
    {
        int born_val = my_atoi(&p);
        int surv_val = my_atoi(&p);
        if (born_val == -1 || surv_val == -1)
            print("Error: Invalid arguments for 'rule'. Usage: rule <born_mask> <surv_mask>\n");
        else
            RuleCmd(born_val, surv_val);
    } 
    else if (strcmp(command, "stop") == 1) 
    {
        StopCmd();
    } 
    else if (strcmp(command, "start") == 1) 
    {
        StartCmd();
    } 
    else if (strcmp(command, "fill") == 1) 
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
    else if (strcmp(command, "clean") == 1) 
    {
        CleanCmd();
    } 
    else if (strcmp(command, "help") == 1) 
    {
        // Пропускаем пробел после "help", если он есть
        while (*p == ' ') p++;

        // Передаем оставшуюся часть строки как аргумент
        HelpCmd(p);
    } 
    else if (strcmp(command, "set-glider") == 1) 
    {
        int x = my_atoi(&p);
        int y = my_atoi(&p);
        if (x == -1 || y == -1) 
            print("Error: Invalid arguments for 'set-glider'. Usage: set-glider <x> <y>\n");
        else
            SetGliderCmd(x, y);
    } 
    else 
    {
        print("Error: Unknown command '");
        print(command);
        print("'. Type 'help'.\n");
    }
}

//---- MAIN ----
// Пример основного цикла (очень упрощенный)
int main()
{
    qInit();
    ISTATE = 1; // Set interrupt flag to 1 (предполагается использование прерываний для ввода)

    // --- Пример использования ---
    // Допустим, пользователь ввел "set 5 5 1" и нажал Enter (символ \n)
    // Прерывания (или другой механизм ввода) поместили символы в очередь:
    /*
    qPush('s'); qPush('e'); qPush('t'); qPush(' ');
    qPush('5'); qPush(' '); qPush('5'); qPush(' '); qPush('1');
    // qPush('\n'); // Возможно, нужен символ-разделитель команд, но parse() его не обрабатывает
    */

    // Затем где-то вызывается parse(), например, по таймеру или после получения '\n'
    // parse(); // Вызов для обработки команды из очереди

    // --- Пример 2: help ---
    /*
    qPush('h'); qPush('e'); qPush('l'); qPush('p');
    parse(); // Выведет общую помощь
    */

    // --- Пример 3: help set ---
    /*
    qPush('h'); qPush('e'); qPush('l'); qPush('p'); qPush(' ');
    qPush('s'); qPush('e'); qPush('t');
    parse(); // Выведет помощь по команде set
    */


    // Бесконечный цикл ожидания (типично для эмбеддед или ожидания прерываний)
    while (1)
    {
        // Здесь может быть проверка флага, что новая команда готова в очереди,
        // и если да, то вызов parse()
        // Например: if (command_ready_flag) { parse(); command_ready_flag = 0; }

        // Просто холостой цикл, как в оригинале
        volatile int dummy = 1 + 1; // volatile чтобы компилятор не выкинул цикл
        dummy = dummy; // Заглушка использования
    }

    return 0; // Никогда не достигнется
}