.class public abstract Lcom/beyond/JletBridge;
.super Ljava/lang/Object;
.source "JletBridge.java"


# static fields
.field public static final ACTIVE:I = 0x1

.field public static final DESTROYED:I = 0x0

.field public static final PAUSED:I = 0x2


# instance fields
.field dis0:Lcom/beyond/DisplayBridge;

.field eq0:Lcom/beyond/EventQueueBridge;

.field public state:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x2

    iput v0, p0, Lcom/beyond/JletBridge;->state:I

    .line 10
    return-void
.end method


# virtual methods
.method protected abstract destroyApp(Z)V
.end method

.method protected init(Lcom/beyond/DisplayBridge;Lcom/beyond/EventQueueBridge;)V
    .locals 0
    .param p1, "dis"    # Lcom/beyond/DisplayBridge;
    .param p2, "eq"    # Lcom/beyond/EventQueueBridge;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/beyond/JletBridge;->dis0:Lcom/beyond/DisplayBridge;

    .line 27
    iput-object p2, p0, Lcom/beyond/JletBridge;->eq0:Lcom/beyond/EventQueueBridge;

    .line 28
    return-void
.end method

.method public final notifyDestroyed()V
    .locals 3

    .prologue
    .line 63
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "notifyDestroyed"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 64
    iget v1, p0, Lcom/beyond/JletBridge;->state:I

    if-nez v1, :cond_0

    .line 74
    :goto_0
    return-void

    .line 68
    :cond_0
    const/4 v1, 0x4

    new-array v0, v1, [I

    .line 70
    .local v0, "event":[I
    const/4 v1, 0x0

    const/16 v2, 0x64

    aput v2, v0, v1

    .line 71
    const/4 v1, 0x1

    const/4 v2, 0x3

    aput v2, v0, v1

    .line 73
    iget-object v1, p0, Lcom/beyond/JletBridge;->eq0:Lcom/beyond/EventQueueBridge;

    invoke-virtual {v1, v0}, Lcom/beyond/EventQueueBridge;->postEvent([I)Z

    goto :goto_0
.end method

.method final declared-synchronized notifyPaused()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 35
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/beyond/JletBridge;->state:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v1, v2, :cond_0

    .line 46
    :goto_0
    monitor-exit p0

    return-void

    .line 38
    :cond_0
    const/4 v1, 0x4

    :try_start_1
    new-array v0, v1, [I

    .line 40
    .local v0, "event":[I
    const/4 v1, 0x0

    const/16 v2, 0x64

    aput v2, v0, v1

    .line 41
    const/4 v1, 0x1

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 43
    iget-object v1, p0, Lcom/beyond/JletBridge;->eq0:Lcom/beyond/EventQueueBridge;

    invoke-virtual {v1, v0}, Lcom/beyond/EventQueueBridge;->postEvent([I)Z

    .line 45
    const/4 v1, 0x2

    iput v1, p0, Lcom/beyond/JletBridge;->state:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 35
    .end local v0    # "event":[I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method postEvent([I)Z
    .locals 1
    .param p1, "event"    # [I

    .prologue
    .line 31
    iget-object v0, p0, Lcom/beyond/JletBridge;->eq0:Lcom/beyond/EventQueueBridge;

    invoke-virtual {v0, p1}, Lcom/beyond/EventQueueBridge;->internalPostEvent([I)Z

    move-result v0

    return v0
.end method

.method final declared-synchronized requestResumed()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 49
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/beyond/JletBridge;->state:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v1, v2, :cond_0

    .line 60
    :goto_0
    monitor-exit p0

    return-void

    .line 53
    :cond_0
    const/4 v1, 0x4

    :try_start_1
    new-array v0, v1, [I

    .line 55
    .local v0, "event":[I
    const/4 v1, 0x0

    const/16 v2, 0x64

    aput v2, v0, v1

    .line 56
    const/4 v1, 0x1

    const/4 v2, 0x2

    aput v2, v0, v1

    .line 58
    iget-object v1, p0, Lcom/beyond/JletBridge;->eq0:Lcom/beyond/EventQueueBridge;

    invoke-virtual {v1, v0}, Lcom/beyond/EventQueueBridge;->postEvent([I)Z

    .line 59
    const/4 v1, 0x1

    iput v1, p0, Lcom/beyond/JletBridge;->state:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 49
    .end local v0    # "event":[I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected abstract startApp([Ljava/lang/String;)V
.end method
