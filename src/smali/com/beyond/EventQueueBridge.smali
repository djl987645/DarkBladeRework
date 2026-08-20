.class public abstract Lcom/beyond/EventQueueBridge;
.super Ljava/lang/Object;
.source "EventQueueBridge.java"


# static fields
.field public static final ANN_EVENT:I = 0x8

.field public static final APP_ACTIVE:I = 0x4

.field public static final APP_DESTROY:I = 0x3

.field public static final APP_EVENT:I = 0x64

.field public static final APP_RESUME:I = 0x2

.field public static final APP_STOP:I = 0x1

.field public static final BATT_EVENT:I = 0x6

.field public static final CALL_EVENT:I = 0x7

.field public static final CHILDSTART_EVENT:I = 0x65

.field public static final CHILDSTOP_EVENT:I = 0x66

.field protected static final EVENT_BUFFER_COUNT:I = 0x40

.field static final EVENT_BUFFER_SIZE:I = 0x100

.field static final EVENT_MAXKEY_COUNT:I = 0x30

.field public static final EVENT_SIZE:I = 0x4

.field public static final KEY_EVENT:I = 0x1

.field public static final KEY_PRESSED:I = 0x1

.field public static final KEY_RELEASED:I = 0x2

.field public static final KEY_REPEATED:I = 0x3

.field public static final KEY_TYPED:I = 0x4

.field public static final MEDIA_EVENT:I = 0x1004

.field public static final POINTER_EVENT:I = 0x2

.field public static final POINT_DRAGGED:I = 0x5

.field public static final POINT_PRESSED:I = 0x1

.field public static final POINT_RELEASED:I = 0x2

.field public static final REPAINT_REQ_EVENT:I = 0x33

.field public static final RSSI_EVENT:I = 0x5

.field public static final SENSOR_EVENT:I = 0x9

.field public static final SMS_EVENT:I = 0x4


# instance fields
.field protected buf:[I

.field private el:[I

.field protected front:I

.field protected left:I

.field protected rear:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/16 v0, 0x100

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    .line 58
    iput v1, p0, Lcom/beyond/EventQueueBridge;->front:I

    .line 59
    iput v1, p0, Lcom/beyond/EventQueueBridge;->rear:I

    .line 112
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/beyond/EventQueueBridge;->el:[I

    .line 6
    return-void
.end method

.method protected static event2Clip(II)Lcom/beyond/MediaBridge;
    .locals 1
    .param p0, "event"    # I
    .param p1, "magicID"    # I

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/beyond/MediaBridge;->event2Clip(II)Lcom/beyond/MediaBridge;

    move-result-object v0

    return-object v0
.end method

.method private getLastEvent([I)V
    .locals 4
    .param p1, "event"    # [I

    .prologue
    .line 103
    monitor-enter p0

    .line 104
    :try_start_0
    iget v2, p0, Lcom/beyond/EventQueueBridge;->rear:I

    mul-int/lit8 v0, v2, 0x4

    .line 105
    .local v0, "i":I
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aget v3, v3, v0

    aput v3, p1, v2

    .line 106
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    aget v3, v3, v1

    aput v3, p1, v2

    .line 107
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .restart local v1    # "i":I
    aget v3, v3, v0

    aput v3, p1, v2

    .line 108
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    aget v3, v3, v1

    aput v3, p1, v2

    .line 103
    monitor-exit p0

    .line 110
    return-void

    .line 103
    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public abstract dispatchEvent([I)V
.end method

.method public enqueEvent(IIIII)Z
    .locals 2
    .param p1, "id"    # I
    .param p2, "type"    # I
    .param p3, "param1"    # I
    .param p4, "parma2"    # I
    .param p5, "parma3"    # I

    .prologue
    .line 67
    const/4 v1, 0x4

    new-array v0, v1, [I

    .line 68
    .local v0, "evt":[I
    const/4 v1, 0x0

    aput p2, v0, v1

    .line 69
    const/4 v1, 0x1

    aput p3, v0, v1

    .line 70
    const/4 v1, 0x2

    aput p4, v0, v1

    .line 71
    const/4 v1, 0x3

    aput p5, v0, v1

    .line 73
    invoke-virtual {p0, v0}, Lcom/beyond/EventQueueBridge;->internalPostEvent([I)Z

    move-result v1

    return v1
.end method

.method public abstract getNextEvent([I)V
.end method

.method public declared-synchronized internalPostEvent([I)Z
    .locals 6
    .param p1, "event"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 119
    monitor-enter p0

    const/4 v4, 0x3

    :try_start_0
    aget v0, p1, v4

    .line 122
    .local v0, "i":I
    const/4 v4, 0x0

    aget v4, p1, v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_0

    iget v4, p0, Lcom/beyond/EventQueueBridge;->left:I

    const/4 v5, 0x5

    if-le v4, v5, :cond_0

    .line 123
    iget-object v4, p0, Lcom/beyond/EventQueueBridge;->el:[I

    invoke-direct {p0, v4}, Lcom/beyond/EventQueueBridge;->getLastEvent([I)V

    .line 124
    iget-object v4, p0, Lcom/beyond/EventQueueBridge;->el:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    const/4 v5, 0x0

    aget v5, p1, v5

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/beyond/EventQueueBridge;->el:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    const/4 v5, 0x1

    aget v5, p1, v5

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/beyond/EventQueueBridge;->el:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    const/4 v5, 0x2

    aget v5, p1, v5

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/beyond/EventQueueBridge;->el:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    const/4 v5, 0x3

    aget v5, p1, v5

    if-ne v4, v5, :cond_0

    .line 125
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    :goto_0
    monitor-exit p0

    return v2

    .line 131
    :cond_0
    :try_start_1
    iget v4, p0, Lcom/beyond/EventQueueBridge;->left:I

    const/16 v5, 0x38

    if-lt v4, v5, :cond_1

    .line 132
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    move v2, v3

    .line 134
    goto :goto_0

    .line 137
    :cond_1
    const/4 v4, 0x0

    aget v4, p1, v4

    if-ne v4, v2, :cond_2

    .line 138
    iget v4, p0, Lcom/beyond/EventQueueBridge;->left:I

    const/16 v5, 0x30

    if-lt v4, v5, :cond_2

    .line 139
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    move v2, v3

    .line 140
    goto :goto_0

    .line 146
    :cond_2
    iget v3, p0, Lcom/beyond/EventQueueBridge;->rear:I

    add-int/lit8 v3, v3, 0x1

    and-int/lit8 v3, v3, 0x3f

    iput v3, p0, Lcom/beyond/EventQueueBridge;->rear:I

    .line 147
    iget v3, p0, Lcom/beyond/EventQueueBridge;->rear:I

    mul-int/lit8 v0, v3, 0x4

    .line 149
    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    const/4 v4, 0x0

    aget v4, p1, v4

    aput v4, v3, v0

    .line 150
    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    const/4 v4, 0x1

    aget v4, p1, v4

    aput v4, v3, v1

    .line 151
    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .restart local v1    # "i":I
    const/4 v4, 0x2

    aget v4, p1, v4

    aput v4, v3, v0

    .line 152
    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    const/4 v4, 0x3

    aget v4, p1, v4

    aput v4, v3, v1

    .line 154
    iget v3, p0, Lcom/beyond/EventQueueBridge;->left:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/beyond/EventQueueBridge;->left:I

    .line 156
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    .line 158
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 119
    .end local v0    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected onGetNextEvent([I)V
    .locals 4
    .param p1, "event"    # [I

    .prologue
    .line 77
    monitor-enter p0

    .line 78
    :goto_0
    :try_start_0
    iget v2, p0, Lcom/beyond/EventQueueBridge;->left:I

    if-eqz v2, :cond_0

    .line 86
    iget v2, p0, Lcom/beyond/EventQueueBridge;->front:I

    add-int/lit8 v2, v2, 0x1

    and-int/lit8 v2, v2, 0x3f

    iput v2, p0, Lcom/beyond/EventQueueBridge;->front:I

    .line 87
    iget v2, p0, Lcom/beyond/EventQueueBridge;->front:I

    mul-int/lit8 v0, v2, 0x4

    .line 88
    .local v0, "i":I
    iget v2, p0, Lcom/beyond/EventQueueBridge;->left:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/beyond/EventQueueBridge;->left:I

    .line 92
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aget v3, v3, v0

    aput v3, p1, v2

    .line 93
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    aget v3, v3, v1

    aput v3, p1, v2

    .line 94
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .restart local v1    # "i":I
    aget v3, v3, v0

    aput v3, p1, v2

    .line 95
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/beyond/EventQueueBridge;->buf:[I

    aget v3, v3, v1

    aput v3, p1, v2

    .line 77
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    return-void

    .line 80
    .end local v1    # "i":I
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 82
    :catch_0
    move-exception v2

    goto :goto_0

    .line 77
    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public abstract postEvent([I)Z
.end method
