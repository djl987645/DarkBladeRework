.class public Lcom/beyond/io/SerialStack;
.super Ljava/lang/Object;
.source "SerialStack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/beyond/io/SerialStack$Terminator;,
        Lcom/beyond/io/SerialStack$Waiter;,
        Lcom/beyond/io/SerialStack$serialWatcher;
    }
.end annotation


# static fields
.field public static final CMD_ACCEPT:I = 0x7a

.field public static final CMD_CLOSE:I = 0xe

.field public static final CMD_CONNECT:I = 0xb

.field public static final CMD_DEBUG:I = 0xf

.field public static final CMD_EVENT:I = 0x70

.field public static final CMD_GETIP:I = 0x10

.field public static final CMD_LISTEN:I = 0x79

.field public static final CMD_READ:I = 0xc

.field public static final CMD_READUDP:I = 0x11

.field public static final CMD_RESET:I = 0x71

.field public static final CMD_WRITE:I = 0xd

.field public static final CMD_WRITEUDP:I = 0x12

.field public static final FAIL:I = 0x0

.field public static final MAXSOCKET:I = 0xa

.field public static final OK:I = 0x1

.field public static final PACKET_DATA_SIZE:I = 0x200

.field public static final TCP:I = 0x1

.field public static final UDP:I

.field static closed:Z

.field static debugMsgPos:I

.field static debugfd:I

.field static refcnt:I

.field static sc:I

.field static sockets:[Lcom/beyond/io/Requester;

.field static watcher:Lcom/beyond/io/SerialStack$serialWatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 96
    sput v2, Lcom/beyond/io/SerialStack;->refcnt:I

    .line 100
    sput-object v3, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    .line 101
    const/4 v1, 0x1

    sput-boolean v1, Lcom/beyond/io/SerialStack;->closed:Z

    .line 103
    sput v2, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    .line 104
    const/4 v1, -0x1

    sput v1, Lcom/beyond/io/SerialStack;->debugfd:I

    .line 110
    const/16 v1, 0xa

    new-array v1, v1, [Lcom/beyond/io/Requester;

    sput-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    .line 111
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 122
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "serial stack init ok"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    return-void

    .line 112
    :cond_0
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aput-object v3, v1, v0

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static accept(III)Lcom/beyond/io/socket;
    .locals 18
    .param p0, "fd"    # I
    .param p1, "mode"    # I
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 489
    invoke-static/range {p0 .. p0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v16

    check-cast v16, Lcom/beyond/io/SocketRequester;

    .line 490
    .local v16, "req":Lcom/beyond/io/SocketRequester;
    if-nez v16, :cond_0

    .line 491
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 494
    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Lcom/beyond/io/SerialStack;->allocRequester(ZZLjava/lang/String;S)I

    move-result v14

    .line 496
    .local v14, "fd2":I
    const/4 v1, 0x4

    new-array v6, v1, [B

    .line 497
    .local v6, "tmp":[B
    const/4 v1, 0x0

    ushr-int/lit8 v2, v14, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v6, v1

    .line 498
    const/4 v1, 0x1

    ushr-int/lit8 v2, v14, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v6, v1

    .line 499
    const/4 v1, 0x2

    ushr-int/lit8 v2, v14, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v6, v1

    .line 500
    const/4 v1, 0x3

    and-int/lit16 v2, v14, 0xff

    int-to-byte v2, v2

    aput-byte v2, v6, v1

    .line 501
    move-object/from16 v0, v16

    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->buf:[B

    const/16 v2, 0x7a

    .line 502
    move-object/from16 v0, v16

    iget v4, v0, Lcom/beyond/io/SocketRequester;->pcfd:I

    const/4 v5, 0x0

    .line 503
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move/from16 v3, p0

    .line 501
    invoke-static/range {v1 .. v9}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v15

    .line 504
    .local v15, "len":I
    const/16 v1, 0x7a

    move-object/from16 v0, v16

    iput v1, v0, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 505
    sget-object v1, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0, v15}, Lcom/beyond/io/SerialStack$serialWatcher;->register(Lcom/beyond/io/Requester;I)I

    .line 506
    move-object/from16 v0, v16

    iget v1, v0, Lcom/beyond/io/SocketRequester;->ret:I

    if-gez v1, :cond_1

    .line 507
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket accept fail"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 511
    :cond_1
    invoke-static {v14}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v17

    check-cast v17, Lcom/beyond/io/SocketRequester;

    .line 512
    .local v17, "req2":Lcom/beyond/io/SocketRequester;
    if-nez v17, :cond_2

    .line 513
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 515
    :cond_2
    move-object/from16 v0, v16

    iget v1, v0, Lcom/beyond/io/SocketRequester;->pcfd2:I

    move-object/from16 v0, v17

    iput v1, v0, Lcom/beyond/io/SocketRequester;->pcfd:I

    .line 516
    move-object/from16 v0, v16

    iget v1, v0, Lcom/beyond/io/SocketRequester;->remoteip:I

    move-object/from16 v0, v17

    iput v1, v0, Lcom/beyond/io/SocketRequester;->remoteip:I

    .line 517
    move-object/from16 v0, v16

    iget-short v1, v0, Lcom/beyond/io/SocketRequester;->remoteport:S

    move-object/from16 v0, v17

    iput-short v1, v0, Lcom/beyond/io/SocketRequester;->remoteport:S

    .line 522
    new-instance v7, Lcom/beyond/io/socket;

    move-object/from16 v0, v17

    iget v8, v0, Lcom/beyond/io/SocketRequester;->fd:I

    const/4 v11, 0x1

    .line 523
    move-object/from16 v0, v17

    iget v12, v0, Lcom/beyond/io/SocketRequester;->remoteip:I

    move-object/from16 v0, v17

    iget-short v13, v0, Lcom/beyond/io/SocketRequester;->remoteport:S

    move/from16 v9, p1

    move/from16 v10, p2

    .line 522
    invoke-direct/range {v7 .. v13}, Lcom/beyond/io/socket;-><init>(IIIZIS)V

    return-object v7
.end method

.method private static allocRequester(ZZLjava/lang/String;S)I
    .locals 6
    .param p0, "getip"    # Z
    .param p1, "stream"    # Z
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xa

    .line 786
    const/4 v1, 0x0

    .line 787
    .local v1, "req":Lcom/beyond/io/Requester;
    const/4 v0, -0x1

    .line 788
    .local v0, "i":I
    sget-object v4, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v4

    .line 789
    :try_start_0
    sget v3, Lcom/beyond/io/SerialStack;->refcnt:I

    if-lt v3, v5, :cond_0

    .line 790
    new-instance v3, Ljava/io/IOException;

    const-string v5, "too many socket create"

    invoke-direct {v3, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 788
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 794
    :cond_0
    :try_start_1
    sget v3, Lcom/beyond/io/SerialStack;->refcnt:I

    if-nez v3, :cond_1

    .line 795
    invoke-static {}, Lcom/beyond/io/SerialStack;->openSerial()V

    .line 798
    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-lt v0, v5, :cond_3

    .line 803
    :cond_2
    if-eqz p0, :cond_4

    .line 804
    new-instance v2, Lcom/beyond/io/Requester;

    invoke-direct {v2, p2, v0}, Lcom/beyond/io/Requester;-><init>(Ljava/lang/String;I)V

    .end local v1    # "req":Lcom/beyond/io/Requester;
    .local v2, "req":Lcom/beyond/io/Requester;
    move-object v1, v2

    .line 808
    .end local v2    # "req":Lcom/beyond/io/Requester;
    .restart local v1    # "req":Lcom/beyond/io/Requester;
    :goto_1
    sget-object v3, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aput-object v1, v3, v0

    .line 811
    const/4 v3, 0x0

    iput v3, v1, Lcom/beyond/io/Requester;->appID:I

    .line 812
    sget v3, Lcom/beyond/io/SerialStack;->refcnt:I

    add-int/lit8 v3, v3, 0x1

    sput v3, Lcom/beyond/io/SerialStack;->refcnt:I

    .line 788
    monitor-exit v4

    .line 815
    return v0

    .line 799
    :cond_3
    sget-object v3, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v3, v3, v0

    if-eqz v3, :cond_2

    .line 798
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 806
    :cond_4
    new-instance v2, Lcom/beyond/io/SocketRequester;

    invoke-direct {v2, p1, p2, p3, v0}, Lcom/beyond/io/SocketRequester;-><init>(ZLjava/lang/String;SI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "req":Lcom/beyond/io/Requester;
    .restart local v2    # "req":Lcom/beyond/io/Requester;
    move-object v1, v2

    .end local v2    # "req":Lcom/beyond/io/Requester;
    .restart local v1    # "req":Lcom/beyond/io/Requester;
    goto :goto_1
.end method

.method static avail(I)I
    .locals 3
    .param p0, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 627
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v0

    check-cast v0, Lcom/beyond/io/SocketRequester;

    .line 628
    .local v0, "req":Lcom/beyond/io/SocketRequester;
    if-nez v0, :cond_0

    .line 629
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 631
    :cond_0
    iget v1, v0, Lcom/beyond/io/SocketRequester;->len:I

    return v1
.end method

.method static close(I)V
    .locals 12
    .param p0, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v1, 0xe

    const/4 v4, 0x0

    .line 531
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v11

    check-cast v11, Lcom/beyond/io/SocketRequester;

    .line 532
    .local v11, "req":Lcom/beyond/io/SocketRequester;
    if-nez v11, :cond_0

    .line 533
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket already closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 536
    :cond_0
    if-nez v11, :cond_1

    .line 559
    :goto_0
    return-void

    .line 541
    :cond_1
    iget v0, v11, Lcom/beyond/io/SocketRequester;->pcfd:I

    if-ltz v0, :cond_2

    .line 542
    iget-object v0, v11, Lcom/beyond/io/SocketRequester;->buf:[B

    .line 543
    iget v3, v11, Lcom/beyond/io/SocketRequester;->pcfd:I

    move v2, p0

    move v6, v4

    move-object v7, v5

    move v8, v4

    .line 542
    invoke-static/range {v0 .. v8}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v10

    .line 546
    .local v10, "len":I
    iput v1, v11, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 548
    :try_start_0
    sget-object v0, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    iget-object v1, v11, Lcom/beyond/io/SocketRequester;->buf:[B

    invoke-virtual {v0, v1, v10}, Lcom/beyond/io/SerialStack$serialWatcher;->writeSerial([BI)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 556
    .end local v10    # "len":I
    :cond_2
    sget-object v0, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v0, p0}, Lcom/beyond/io/SerialStack$serialWatcher;->closeRequestingRequester(I)V

    .line 558
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    goto :goto_0

    .line 549
    .restart local v10    # "len":I
    :catch_0
    move-exception v9

    .line 550
    .local v9, "e":Ljava/io/IOException;
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    .line 551
    throw v9
.end method

.method static closeDebugPort()V
    .locals 1

    .prologue
    .line 201
    sget v0, Lcom/beyond/io/SerialStack;->debugfd:I

    if-gez v0, :cond_0

    .line 206
    :goto_0
    return-void

    .line 205
    :cond_0
    sget v0, Lcom/beyond/io/SerialStack;->debugfd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    goto :goto_0
.end method

.method public static closeSerial()V
    .locals 4

    .prologue
    .line 177
    sget-boolean v1, Lcom/beyond/io/SerialStack;->closed:Z

    if-eqz v1, :cond_0

    .line 198
    .local v0, "i":I
    :goto_0
    return-void

    .line 179
    .end local v0    # "i":I
    :cond_0
    sget-object v2, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v2

    .line 180
    const/4 v1, 0x1

    :try_start_0
    sput-boolean v1, Lcom/beyond/io/SerialStack;->closed:Z

    .line 181
    sget-object v1, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v1}, Lcom/beyond/io/SerialStack$serialWatcher;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    :try_start_1
    sget v1, Lcom/beyond/io/SerialStack;->sc:I

    invoke-static {v1}, Lcom/beyond/io/SerialStack;->nativeSerialClose(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    :goto_1
    const/4 v1, 0x0

    :try_start_2
    sput v1, Lcom/beyond/io/SerialStack;->refcnt:I

    .line 192
    const/4 v1, -0x1

    sput v1, Lcom/beyond/io/SerialStack;->debugfd:I

    .line 193
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    const/16 v1, 0xa

    if-lt v0, v1, :cond_1

    .line 196
    const/4 v1, 0x0

    sput-object v1, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    .line 179
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 194
    :cond_1
    :try_start_3
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    const/4 v3, 0x0

    aput-object v3, v1, v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 189
    .end local v0    # "i":I
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method static deallocRequester(I)V
    .locals 3
    .param p0, "fd"    # I

    .prologue
    .line 611
    if-gez p0, :cond_0

    .line 624
    :goto_0
    return-void

    .line 615
    :cond_0
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v1

    .line 616
    :try_start_0
    sget-object v0, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v0, v0, p0

    if-eqz v0, :cond_1

    .line 617
    sget-object v0, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    const/4 v2, 0x0

    aput-object v2, v0, p0

    .line 618
    sget v0, Lcom/beyond/io/SerialStack;->refcnt:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/beyond/io/SerialStack;->refcnt:I

    if-nez v0, :cond_1

    .line 620
    invoke-static {}, Lcom/beyond/io/SerialStack;->closeSerial()V

    .line 615
    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static findRequester(I)Lcom/beyond/io/Requester;
    .locals 3
    .param p0, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 595
    if-ltz p0, :cond_0

    const/16 v0, 0xa

    if-le p0, v0, :cond_1

    .line 596
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "invalid fd"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 598
    :cond_1
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v1

    .line 599
    :try_start_0
    sget-object v0, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v0, v0, p0

    if-nez v0, :cond_2

    .line 600
    new-instance v0, Ljava/io/IOException;

    const-string v2, "already closed"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 598
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 602
    :cond_2
    :try_start_1
    sget-object v0, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v0, v0, p0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method

.method static freeByID(I)V
    .locals 4
    .param p0, "id"    # I

    .prologue
    .line 567
    :try_start_0
    sget-object v2, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 568
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    .line 567
    :try_start_1
    monitor-exit v2

    .line 580
    .end local v0    # "i":I
    :goto_1
    return-void

    .line 569
    .restart local v0    # "i":I
    :cond_0
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/beyond/io/Requester;->appID:I

    if-ne v1, p0, :cond_1

    .line 571
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/beyond/io/Requester;->cmd:I

    const/16 v3, 0x10

    if-eq v1, v3, :cond_2

    .line 572
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/beyond/io/Requester;->fd:I

    invoke-static {v1}, Lcom/beyond/io/SerialStack;->close(I)V

    .line 568
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 574
    :cond_2
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/beyond/io/Requester;->fd:I

    invoke-static {v1}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    goto :goto_2

    .line 567
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 579
    .end local v0    # "i":I
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method static synchronized native declared-synchronized getExitAppID()I
.end method

.method static getIP(Ljava/lang/String;)I
    .locals 13
    .param p0, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x10

    const/4 v6, 0x0

    .line 262
    if-nez p0, :cond_0

    .line 263
    new-instance v0, Ljava/io/IOException;

    const-string v1, "getIP: host null"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 266
    :cond_0
    const/4 v0, 0x1

    invoke-static {v0, v6, p0, v6}, Lcom/beyond/io/SerialStack;->allocRequester(ZZLjava/lang/String;S)I

    move-result v2

    .line 268
    .local v2, "fd":I
    invoke-static {v2}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v11

    .line 269
    .local v11, "req":Lcom/beyond/io/Requester;
    if-nez v11, :cond_1

    .line 270
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 273
    :cond_1
    iget-object v0, v11, Lcom/beyond/io/Requester;->buf:[B

    .line 274
    iget v3, v11, Lcom/beyond/io/Requester;->addrlen:I

    iget v4, v11, Lcom/beyond/io/Requester;->addrlen:I

    .line 275
    iget-object v5, v11, Lcom/beyond/io/Requester;->addr:[B

    const/4 v7, 0x0

    move v8, v6

    .line 273
    invoke-static/range {v0 .. v8}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v10

    .line 276
    .local v10, "len":I
    iput v1, v11, Lcom/beyond/io/Requester;->cmd:I

    .line 278
    :try_start_0
    sget-object v0, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v0, v11, v10}, Lcom/beyond/io/SerialStack$serialWatcher;->register(Lcom/beyond/io/Requester;I)I

    .line 279
    iget v12, v11, Lcom/beyond/io/Requester;->ret:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    .local v12, "ret":I
    :goto_0
    invoke-static {v2}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    .line 287
    return v12

    .line 280
    .end local v12    # "ret":I
    :catch_0
    move-exception v9

    .line 281
    .local v9, "e":Ljava/lang/Exception;
    const/4 v12, -0x1

    .restart local v12    # "ret":I
    goto :goto_0
.end method

.method static getMaximumLength(I)I
    .locals 3
    .param p0, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v0

    check-cast v0, Lcom/beyond/io/SocketRequester;

    .line 636
    .local v0, "req":Lcom/beyond/io/SocketRequester;
    if-nez v0, :cond_0

    .line 637
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 639
    :cond_0
    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->data:[B

    array-length v1, v1

    return v1
.end method

.method static getNominalLength(I)I
    .locals 1
    .param p0, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 643
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->getMaximumLength(I)I

    move-result v0

    return v0
.end method

.method static listen(S[B)I
    .locals 11
    .param p0, "port"    # S
    .param p1, "newport"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/16 v1, 0x79

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 459
    invoke-static {v4, v3, v7, v4}, Lcom/beyond/io/SerialStack;->allocRequester(ZZLjava/lang/String;S)I

    move-result v2

    .line 460
    .local v2, "fd":I
    invoke-static {v2}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v10

    check-cast v10, Lcom/beyond/io/SocketRequester;

    .line 461
    .local v10, "req":Lcom/beyond/io/SocketRequester;
    if-nez v10, :cond_0

    .line 462
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 465
    :cond_0
    if-nez v10, :cond_1

    .line 466
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 468
    :cond_1
    const/4 v0, 0x2

    new-array v5, v0, [B

    .line 469
    .local v5, "tmp":[B
    ushr-int/lit8 v0, p0, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, v5, v4

    .line 470
    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    aput-byte v0, v5, v3

    .line 471
    iget-object v0, v10, Lcom/beyond/io/SocketRequester;->buf:[B

    move v6, v4

    move v8, v4

    invoke-static/range {v0 .. v8}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v9

    .line 474
    .local v9, "len":I
    iput v1, v10, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 475
    sget-object v0, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v0, v10, v9}, Lcom/beyond/io/SerialStack$serialWatcher;->register(Lcom/beyond/io/Requester;I)I

    .line 476
    iget v0, v10, Lcom/beyond/io/SocketRequester;->ret:I

    if-gez v0, :cond_2

    .line 477
    invoke-static {v2}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    .line 478
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket listen fail"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 480
    :cond_2
    iget-short v0, v10, Lcom/beyond/io/SocketRequester;->port:S

    shr-int/lit8 v0, v0, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p1, v4

    .line 481
    iget-short v0, v10, Lcom/beyond/io/SocketRequester;->port:S

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p1, v3

    .line 482
    return v2
.end method

.method static makeData([BIIII[BI[BI)I
    .locals 7
    .param p0, "dst"    # [B
    .param p1, "type"    # I
    .param p2, "fd"    # I
    .param p3, "PSD"    # I
    .param p4, "dlen"    # I
    .param p5, "data"    # [B
    .param p6, "doff"    # I
    .param p7, "more"    # [B
    .param p8, "moff"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/16 v4, 0x200

    .line 671
    sparse-switch p1, :sswitch_data_0

    .line 698
    if-le p4, v4, :cond_0

    move p4, v4

    .line 699
    :cond_0
    add-int/lit8 v3, p4, 0xc

    .line 703
    .local v3, "len":I
    :goto_0
    const/4 v1, 0x0

    .line 705
    .local v1, "i":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    ushr-int/lit8 v4, p1, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 706
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    ushr-int/lit8 v4, p1, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 707
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 708
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 710
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, v3, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 711
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    ushr-int/lit8 v4, v3, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 712
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, v3, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 713
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    and-int/lit16 v4, v3, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 715
    const/16 v4, 0xf

    if-ne p1, v4, :cond_3

    move v1, v3

    .line 778
    .end local v1    # "i":I
    .end local v3    # "len":I
    :cond_1
    :goto_1
    :pswitch_0
    return v1

    .line 673
    :sswitch_0
    const/4 v3, 0x6

    .line 674
    .restart local v3    # "len":I
    goto :goto_0

    .line 676
    .end local v3    # "len":I
    :sswitch_1
    const/16 v3, 0xc

    .line 677
    .restart local v3    # "len":I
    goto :goto_0

    .line 679
    .end local v3    # "len":I
    :sswitch_2
    if-le p4, v4, :cond_2

    .line 681
    const/4 v1, -0x1

    goto :goto_1

    .line 683
    :cond_2
    add-int/lit8 v3, p4, 0x12

    .line 684
    .restart local v3    # "len":I
    goto :goto_0

    .line 686
    .end local v3    # "len":I
    :sswitch_3
    const/16 v3, 0x8

    .line 687
    .restart local v3    # "len":I
    goto :goto_0

    .line 689
    .end local v3    # "len":I
    :sswitch_4
    move v3, p4

    .line 690
    .restart local v3    # "len":I
    goto :goto_0

    .line 692
    .end local v3    # "len":I
    :sswitch_5
    add-int/lit8 v3, p4, 0x8

    .line 693
    .restart local v3    # "len":I
    goto :goto_0

    .line 695
    .end local v3    # "len":I
    :sswitch_6
    add-int/lit8 v3, p4, 0x8

    .line 696
    .restart local v3    # "len":I
    goto :goto_0

    .line 718
    .restart local v1    # "i":I
    :cond_3
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p2, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 719
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    ushr-int/lit8 v4, p2, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 720
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p2, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 721
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    and-int/lit16 v4, p2, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 723
    const/16 v4, 0x79

    if-ne p1, v4, :cond_4

    .line 725
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    aget-byte v4, p5, v5

    aput-byte v4, p0, v1

    .line 726
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    aget-byte v4, p5, v6

    aput-byte v4, p0, v2

    goto :goto_1

    .line 731
    :cond_4
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p3, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 732
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    ushr-int/lit8 v4, p3, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 733
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p3, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 734
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    and-int/lit16 v4, p3, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 736
    const/16 v4, 0x7a

    if-ne p1, v4, :cond_5

    .line 738
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    aget-byte v4, p5, v5

    aput-byte v4, p0, v1

    .line 739
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    aget-byte v4, p5, v6

    aput-byte v4, p0, v2

    .line 740
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    const/4 v4, 0x2

    aget-byte v4, p5, v4

    aput-byte v4, p0, v1

    .line 741
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    const/4 v4, 0x3

    aget-byte v4, p5, v4

    aput-byte v4, p0, v2

    goto/16 :goto_1

    .line 745
    :cond_5
    packed-switch p1, :pswitch_data_0

    .line 765
    :cond_6
    :pswitch_1
    array-length v4, p5

    sub-int/2addr v4, p6

    if-le p4, v4, :cond_8

    array-length v4, p5

    sub-int v0, v4, p6

    .line 770
    .local v0, "clen":I
    :goto_2
    invoke-static {p5, p6, p0, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 772
    add-int/2addr v1, v0

    .line 773
    sub-int/2addr p4, v0

    .line 774
    if-lez p4, :cond_1

    .line 775
    invoke-static {p7, p8, p0, v1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 776
    add-int/2addr v1, p4

    goto/16 :goto_1

    .line 752
    .end local v0    # "clen":I
    :pswitch_2
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p4, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 753
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    ushr-int/lit8 v4, p4, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 754
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    ushr-int/lit8 v4, p4, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v1

    .line 755
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    and-int/lit16 v4, p4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 756
    const/16 v4, 0x12

    if-ne p1, v4, :cond_7

    .line 757
    add-int/lit8 p4, p4, 0x6

    .line 759
    :cond_7
    const/16 v4, 0xc

    if-eq p1, v4, :cond_1

    const/16 v4, 0x11

    if-ne p1, v4, :cond_6

    goto/16 :goto_1

    :cond_8
    move v0, p4

    .line 765
    goto :goto_2

    .line 671
    :sswitch_data_0
    .sparse-switch
        0xb -> :sswitch_5
        0xe -> :sswitch_3
        0xf -> :sswitch_4
        0x10 -> :sswitch_6
        0x12 -> :sswitch_2
        0x79 -> :sswitch_0
        0x7a -> :sswitch_1
    .end sparse-switch

    .line 745
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method static native nativeSerialClose(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method static native nativeSerialOpen(ILjava/lang/String;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method static native nativeSerialWrite(I[BI)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method static open(ZLjava/lang/String;S)I
    .locals 11
    .param p0, "stream"    # Z
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0xb

    const/4 v7, 0x2

    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 295
    if-nez p1, :cond_0

    if-eqz p0, :cond_0

    .line 296
    new-instance v0, Ljava/io/IOException;

    const-string v1, "null host"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 298
    :cond_0
    invoke-static {v6, p0, p1, p2}, Lcom/beyond/io/SerialStack;->allocRequester(ZZLjava/lang/String;S)I

    move-result v2

    .line 301
    .local v2, "fd":I
    invoke-static {v2}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v10

    check-cast v10, Lcom/beyond/io/SocketRequester;

    .line 302
    .local v10, "req":Lcom/beyond/io/SocketRequester;
    if-nez v10, :cond_1

    .line 303
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    :cond_1
    if-eqz p1, :cond_3

    .line 308
    iget-object v0, v10, Lcom/beyond/io/SocketRequester;->addr:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    new-array v5, v0, [B

    .line 312
    .local v5, "tmp":[B
    :goto_0
    ushr-int/lit8 v0, p2, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, v5, v6

    .line 313
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, v5, v3

    .line 314
    if-eqz p1, :cond_2

    .line 315
    iget-object v0, v10, Lcom/beyond/io/SocketRequester;->addr:[B

    iget-object v4, v10, Lcom/beyond/io/SocketRequester;->addr:[B

    array-length v4, v4

    invoke-static {v0, v6, v5, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 317
    :cond_2
    iget-object v0, v10, Lcom/beyond/io/SocketRequester;->buf:[B

    .line 320
    if-eqz p0, :cond_4

    :goto_1
    array-length v4, v5

    .line 321
    const/4 v7, 0x0

    move v8, v6

    .line 317
    invoke-static/range {v0 .. v8}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v9

    .line 323
    .local v9, "len":I
    iput v1, v10, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 324
    sget-object v0, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v0, v10, v9}, Lcom/beyond/io/SerialStack$serialWatcher;->register(Lcom/beyond/io/Requester;I)I

    .line 326
    iget v0, v10, Lcom/beyond/io/SocketRequester;->ret:I

    if-gez v0, :cond_5

    .line 328
    invoke-static {v2}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    .line 329
    new-instance v0, Ljava/io/IOException;

    const-string v1, "socket open fail"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 310
    .end local v5    # "tmp":[B
    .end local v9    # "len":I
    :cond_3
    new-array v5, v7, [B

    .restart local v5    # "tmp":[B
    goto :goto_0

    :cond_4
    move v3, v6

    .line 320
    goto :goto_1

    .line 331
    .restart local v9    # "len":I
    :cond_5
    return v2
.end method

.method static openDebugPort()V
    .locals 5

    .prologue
    .line 214
    sget v1, Lcom/beyond/io/SerialStack;->debugfd:I

    if-lez v1, :cond_0

    .line 222
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 218
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_0
    invoke-static {v1, v2, v3, v4}, Lcom/beyond/io/SerialStack;->allocRequester(ZZLjava/lang/String;S)I

    move-result v1

    sput v1, Lcom/beyond/io/SerialStack;->debugfd:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v1, -0x1

    sput v1, Lcom/beyond/io/SerialStack;->debugfd:I

    goto :goto_0
.end method

.method static openSerial()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 141
    sget-boolean v3, Lcom/beyond/io/SerialStack;->closed:Z

    if-nez v3, :cond_0

    .line 165
    .local v2, "w":Lcom/beyond/io/SerialStack$Waiter;
    :goto_0
    return-void

    .line 144
    .end local v2    # "w":Lcom/beyond/io/SerialStack$Waiter;
    :cond_0
    const/4 v3, 0x0

    invoke-static {v6, v3}, Lcom/beyond/io/SerialStack;->nativeSerialOpen(ILjava/lang/String;)I

    move-result v3

    sput v3, Lcom/beyond/io/SerialStack;->sc:I

    .line 146
    const/4 v1, 0x0

    .line 147
    .local v1, "w":Lcom/beyond/io/SerialStack$Waiter;
    sget-object v4, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v4

    .line 148
    :try_start_0
    new-instance v2, Lcom/beyond/io/SerialStack$Waiter;

    invoke-direct {v2}, Lcom/beyond/io/SerialStack$Waiter;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    .end local v1    # "w":Lcom/beyond/io/SerialStack$Waiter;
    .restart local v2    # "w":Lcom/beyond/io/SerialStack$Waiter;
    :try_start_1
    new-instance v3, Lcom/beyond/io/SerialStack$serialWatcher;

    sget v5, Lcom/beyond/io/SerialStack;->sc:I

    invoke-direct {v3, v5, v2}, Lcom/beyond/io/SerialStack$serialWatcher;-><init>(ILcom/beyond/io/SerialStack$Waiter;)V

    sput-object v3, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    .line 150
    sget-object v3, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v3}, Lcom/beyond/io/SerialStack$serialWatcher;->start()V

    .line 147
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 153
    monitor-enter v2

    .line 154
    :goto_1
    :try_start_2
    iget-boolean v3, v2, Lcom/beyond/io/SerialStack$Waiter;->aheadok:Z

    if-eqz v3, :cond_1

    .line 153
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 164
    sput-boolean v6, Lcom/beyond/io/SerialStack;->closed:Z

    goto :goto_0

    .line 147
    .end local v2    # "w":Lcom/beyond/io/SerialStack$Waiter;
    .restart local v1    # "w":Lcom/beyond/io/SerialStack$Waiter;
    :catchall_0
    move-exception v3

    :goto_2
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 156
    .end local v1    # "w":Lcom/beyond/io/SerialStack$Waiter;
    .restart local v2    # "w":Lcom/beyond/io/SerialStack$Waiter;
    :cond_1
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    invoke-static {}, Lcom/beyond/io/SerialStack;->closeSerial()V

    .line 159
    new-instance v3, Ljava/io/IOException;

    const-string v4, "fail to invoke watcher"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 153
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1
    move-exception v3

    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v3

    .line 147
    :catchall_2
    move-exception v3

    move-object v1, v2

    .end local v2    # "w":Lcom/beyond/io/SerialStack$Waiter;
    .restart local v1    # "w":Lcom/beyond/io/SerialStack$Waiter;
    goto :goto_2
.end method

.method static putc(I)V
    .locals 12
    .param p0, "c"    # I

    .prologue
    .line 228
    sget v0, Lcom/beyond/io/SerialStack;->debugfd:I

    if-gez v0, :cond_1

    .line 229
    invoke-static {}, Lcom/beyond/io/SerialStack;->openDebugPort()V

    .line 230
    sget v0, Lcom/beyond/io/SerialStack;->debugfd:I

    if-gez v0, :cond_1

    .line 256
    :cond_0
    :goto_0
    return-void

    .line 236
    :cond_1
    :try_start_0
    sget v0, Lcom/beyond/io/SerialStack;->debugfd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v11

    .line 239
    .local v11, "req":Lcom/beyond/io/Requester;
    iget-object v0, v11, Lcom/beyond/io/Requester;->buf:[B

    sget v1, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    add-int/lit8 v1, v1, 0x8

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 240
    const/16 v0, 0xa

    if-eq p0, v0, :cond_2

    sget v0, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    const/16 v1, 0xff

    if-lt v0, v1, :cond_0

    .line 244
    :cond_2
    iget-object v0, v11, Lcom/beyond/io/Requester;->buf:[B

    sget v1, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    add-int/lit8 v1, v1, 0x8

    const/4 v2, 0x0

    aput-byte v2, v0, v1

    .line 246
    sget v0, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    add-int/lit8 v10, v0, 0x1

    .line 247
    .local v10, "len":I
    iget-object v0, v11, Lcom/beyond/io/Requester;->buf:[B

    const/16 v1, 0xf

    sget v2, Lcom/beyond/io/SerialStack;->debugfd:I

    .line 248
    const/4 v3, 0x0

    add-int/lit8 v4, v10, 0x8

    .line 249
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 247
    invoke-static/range {v0 .. v8}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v10

    .line 250
    const/4 v0, 0x0

    sput v0, Lcom/beyond/io/SerialStack;->debugMsgPos:I

    .line 251
    sget-object v0, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    iget-object v1, v11, Lcom/beyond/io/Requester;->buf:[B

    invoke-virtual {v0, v1, v10}, Lcom/beyond/io/SerialStack$serialWatcher;->writeSerial([BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 252
    .end local v10    # "len":I
    .end local v11    # "req":Lcom/beyond/io/Requester;
    :catch_0
    move-exception v9

    .line 253
    .local v9, "e":Ljava/lang/Exception;
    sget v0, Lcom/beyond/io/SerialStack;->debugfd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    .line 254
    const/4 v0, -0x1

    sput v0, Lcom/beyond/io/SerialStack;->debugfd:I

    goto :goto_0
.end method

.method static read(I[BII[B[B)I
    .locals 12
    .param p0, "fd"    # I
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "ip"    # [B
    .param p5, "port"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 401
    invoke-static {p0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v11

    check-cast v11, Lcom/beyond/io/SocketRequester;

    .line 402
    .local v11, "req":Lcom/beyond/io/SocketRequester;
    if-nez v11, :cond_0

    .line 403
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 406
    :cond_0
    invoke-virtual {v11}, Lcom/beyond/io/SocketRequester;->getInputRequester()Lcom/beyond/io/SocketRequester;

    move-result-object v11

    .line 408
    array-length v1, p1

    sub-int/2addr v1, p2

    if-le p3, v1, :cond_1

    array-length v1, p1

    sub-int p3, v1, p2

    .line 411
    :cond_1
    iget v1, v11, Lcom/beyond/io/SocketRequester;->len:I

    if-lez v1, :cond_3

    .line 412
    iget v1, v11, Lcom/beyond/io/SocketRequester;->len:I

    if-ge p3, v1, :cond_2

    .line 413
    :goto_0
    iget-object v1, v11, Lcom/beyond/io/SocketRequester;->data:[B

    iget v2, v11, Lcom/beyond/io/SocketRequester;->pos:I

    invoke-static {v1, v2, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 414
    iget v1, v11, Lcom/beyond/io/SocketRequester;->len:I

    sub-int/2addr v1, p3

    iput v1, v11, Lcom/beyond/io/SocketRequester;->len:I

    .line 415
    iget v1, v11, Lcom/beyond/io/SocketRequester;->pos:I

    add-int/2addr v1, p3

    iput v1, v11, Lcom/beyond/io/SocketRequester;->pos:I

    move v1, p3

    .line 450
    :goto_1
    return v1

    .line 412
    :cond_2
    iget p3, v11, Lcom/beyond/io/SocketRequester;->len:I

    goto :goto_0

    .line 421
    :cond_3
    const/4 v1, 0x0

    iput v1, v11, Lcom/beyond/io/SocketRequester;->pos:I

    .line 424
    iget-boolean v1, v11, Lcom/beyond/io/SocketRequester;->stream:Z

    if-eqz v1, :cond_4

    const/16 v1, 0xc

    :goto_2
    iput v1, v11, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 425
    iget-object v1, v11, Lcom/beyond/io/SocketRequester;->buf:[B

    iget v2, v11, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 426
    iget v4, v11, Lcom/beyond/io/SocketRequester;->pcfd:I

    iget-object v3, v11, Lcom/beyond/io/SocketRequester;->data:[B

    array-length v5, v3

    .line 427
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v3, p0

    .line 425
    invoke-static/range {v1 .. v9}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v10

    .line 428
    .local v10, "i":I
    sget-object v1, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    invoke-virtual {v1, v11, v10}, Lcom/beyond/io/SerialStack$serialWatcher;->register(Lcom/beyond/io/Requester;I)I

    .line 429
    iget v1, v11, Lcom/beyond/io/SocketRequester;->ret:I

    if-nez v1, :cond_5

    .line 430
    const/4 v1, -0x1

    goto :goto_1

    .line 424
    .end local v10    # "i":I
    :cond_4
    const/16 v1, 0x11

    goto :goto_2

    .line 433
    .restart local v10    # "i":I
    :cond_5
    iget v1, v11, Lcom/beyond/io/SocketRequester;->ret:I

    if-gez v1, :cond_6

    .line 434
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket read error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 438
    :cond_6
    iget-boolean v1, v11, Lcom/beyond/io/SocketRequester;->stream:Z

    if-eqz v1, :cond_7

    .line 439
    iget v1, v11, Lcom/beyond/io/SocketRequester;->tot:I

    iget v2, v11, Lcom/beyond/io/SocketRequester;->len:I

    add-int/2addr v1, v2

    iput v1, v11, Lcom/beyond/io/SocketRequester;->tot:I

    .line 444
    :cond_7
    iget-boolean v1, v11, Lcom/beyond/io/SocketRequester;->stream:Z

    if-nez v1, :cond_1

    .line 445
    iget-object v1, v11, Lcom/beyond/io/SocketRequester;->sock_name:[B

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x4

    move-object/from16 v0, p4

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 446
    iget-object v1, v11, Lcom/beyond/io/SocketRequester;->sock_name:[B

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x2

    move-object/from16 v0, p5

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 447
    iget v1, v11, Lcom/beyond/io/SocketRequester;->ret:I

    if-le v1, p3, :cond_8

    .line 448
    :goto_3
    iget-object v1, v11, Lcom/beyond/io/SocketRequester;->data:[B

    const/4 v2, 0x0

    invoke-static {v1, v2, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 449
    const/4 v1, 0x0

    iput v1, v11, Lcom/beyond/io/SocketRequester;->len:I

    move v1, p3

    .line 450
    goto :goto_1

    .line 447
    :cond_8
    iget p3, v11, Lcom/beyond/io/SocketRequester;->ret:I

    goto :goto_3
.end method

.method static shutdownAll()V
    .locals 4

    .prologue
    .line 584
    :try_start_0
    sget-object v2, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 585
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    .line 584
    :try_start_1
    monitor-exit v2

    .line 592
    :goto_1
    return-void

    .line 586
    :cond_0
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/beyond/io/Requester;->fd:I

    sget v3, Lcom/beyond/io/SerialStack;->debugfd:I

    if-eq v1, v3, :cond_1

    .line 587
    sget-object v1, Lcom/beyond/io/SerialStack;->sockets:[Lcom/beyond/io/Requester;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/beyond/io/Requester;->fd:I

    invoke-static {v1}, Lcom/beyond/io/SerialStack;->deallocRequester(I)V

    .line 585
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 584
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 591
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method static write(I[BIIII)I
    .locals 19
    .param p0, "fd"    # I
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "ip"    # I
    .param p5, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 338
    invoke-static/range {p0 .. p0}, Lcom/beyond/io/SerialStack;->findRequester(I)Lcom/beyond/io/Requester;

    move-result-object v17

    check-cast v17, Lcom/beyond/io/SocketRequester;

    .line 340
    .local v17, "req":Lcom/beyond/io/SocketRequester;
    if-nez v17, :cond_0

    .line 341
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :cond_0
    invoke-virtual/range {v17 .. v17}, Lcom/beyond/io/SocketRequester;->getOutputRequester()Lcom/beyond/io/SocketRequester;

    move-result-object v17

    .line 347
    move-object/from16 v0, v17

    iget-boolean v1, v0, Lcom/beyond/io/SocketRequester;->stream:Z

    if-nez v1, :cond_1

    .line 348
    move-object/from16 v0, v17

    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->data:[B

    array-length v1, v1

    move/from16 v0, p3

    if-le v0, v1, :cond_1

    .line 349
    new-instance v1, Ljava/io/IOException;

    const-string v2, "datagram packet length error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 353
    :cond_1
    move/from16 v18, p3

    .line 355
    .local v18, "savedlen":I
    :goto_0
    if-gtz p3, :cond_2

    .line 394
    return v18

    .line 356
    :cond_2
    move-object/from16 v0, v17

    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->data:[B

    array-length v1, v1

    move/from16 v0, p3

    if-ge v0, v1, :cond_3

    move/from16 v5, p3

    .line 360
    .local v5, "tlen":I
    :goto_1
    move-object/from16 v0, v17

    iget-boolean v1, v0, Lcom/beyond/io/SocketRequester;->stream:Z

    if-eqz v1, :cond_4

    .line 361
    move-object/from16 v0, v17

    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->buf:[B

    const/16 v2, 0xd

    .line 362
    move-object/from16 v0, v17

    iget v4, v0, Lcom/beyond/io/SocketRequester;->pcfd:I

    .line 363
    const/4 v8, 0x0

    const/4 v9, 0x0

    move/from16 v3, p0

    move-object/from16 v6, p1

    move/from16 v7, p2

    .line 361
    invoke-static/range {v1 .. v9}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v15

    .line 384
    .local v15, "i":I
    :goto_2
    move-object/from16 v0, v17

    iget-boolean v1, v0, Lcom/beyond/io/SocketRequester;->stream:Z

    if-eqz v1, :cond_5

    const/16 v1, 0xd

    :goto_3
    move-object/from16 v0, v17

    iput v1, v0, Lcom/beyond/io/SocketRequester;->cmd:I

    .line 385
    sget-object v1, Lcom/beyond/io/SerialStack;->watcher:Lcom/beyond/io/SerialStack$serialWatcher;

    move-object/from16 v0, v17

    invoke-virtual {v1, v0, v15}, Lcom/beyond/io/SerialStack$serialWatcher;->register(Lcom/beyond/io/Requester;I)I

    .line 386
    move-object/from16 v0, v17

    iget v1, v0, Lcom/beyond/io/SocketRequester;->ret:I

    if-gez v1, :cond_6

    .line 387
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket write error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 356
    .end local v5    # "tlen":I
    .end local v15    # "i":I
    :cond_3
    move-object/from16 v0, v17

    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->data:[B

    array-length v5, v1

    goto :goto_1

    .line 365
    .restart local v5    # "tlen":I
    :cond_4
    const/4 v1, 0x6

    new-array v11, v1, [B

    .line 366
    .local v11, "tmp":[B
    const/4 v15, 0x0

    .line 367
    .restart local v15    # "i":I
    add-int/lit8 v16, v15, 0x1

    .end local v15    # "i":I
    .local v16, "i":I
    ushr-int/lit8 v1, p4, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v11, v15

    .line 368
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "i":I
    .restart local v15    # "i":I
    ushr-int/lit8 v1, p4, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v11, v16

    .line 369
    add-int/lit8 v16, v15, 0x1

    .end local v15    # "i":I
    .restart local v16    # "i":I
    ushr-int/lit8 v1, p4, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v11, v15

    .line 370
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "i":I
    .restart local v15    # "i":I
    move/from16 v0, p4

    and-int/lit16 v1, v0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v11, v16

    .line 371
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    aget-byte v3, v11, v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 372
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    aget-byte v3, v11, v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 373
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x2

    aget-byte v3, v11, v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 374
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x3

    aget-byte v3, v11, v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 375
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 377
    add-int/lit8 v16, v15, 0x1

    .end local v15    # "i":I
    .restart local v16    # "i":I
    ushr-int/lit8 v1, p5, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v11, v15

    .line 378
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "i":I
    .restart local v15    # "i":I
    move/from16 v0, p5

    and-int/lit16 v1, v0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v11, v16

    .line 379
    move-object/from16 v0, v17

    iget-object v6, v0, Lcom/beyond/io/SocketRequester;->buf:[B

    const/16 v7, 0x12

    .line 380
    move-object/from16 v0, v17

    iget v9, v0, Lcom/beyond/io/SocketRequester;->pcfd:I

    .line 381
    const/4 v12, 0x0

    move/from16 v8, p0

    move/from16 v10, p3

    move-object/from16 v13, p1

    move/from16 v14, p2

    .line 379
    invoke-static/range {v6 .. v14}, Lcom/beyond/io/SerialStack;->makeData([BIIII[BI[BI)I

    move-result v15

    goto/16 :goto_2

    .line 384
    .end local v11    # "tmp":[B
    :cond_5
    const/16 v1, 0x12

    goto/16 :goto_3

    .line 391
    :cond_6
    move-object/from16 v0, v17

    iget v1, v0, Lcom/beyond/io/SocketRequester;->ret:I

    sub-int p3, p3, v1

    .line 392
    move-object/from16 v0, v17

    iget v1, v0, Lcom/beyond/io/SocketRequester;->ret:I

    add-int p2, p2, v1

    goto/16 :goto_0
.end method
