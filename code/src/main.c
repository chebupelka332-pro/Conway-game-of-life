#define QSIZE 32

extern int ISTATE;
extern int CURR_CHAR;
extern int UPDATE;
extern int START_STOP;
extern int BORN;
extern int SURV;
extern int LINE_ADR;
extern int CELL_ADR;
extern int VALUE;

typedef struct Queue_t
{
    int arr[QSIZE];
    int head;
    int end;
} Queue;


int main()
{
    /*Queue q;
    q.head = 0;
    q.end = 1;

    *a = q.head + q.end;*/
   BORN = 1;

    return 0;
}