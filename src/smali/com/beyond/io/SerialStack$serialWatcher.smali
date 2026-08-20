.class Lcom/beyond/io/SerialStack$serialWatcher;
.super Ljava/lang/Thread;
.source "SerialStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/SerialStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "serialWatcher"
.end annotation


# instance fields
.field closed:Z

.field event:[I

.field fd:I

.field notified:Z

.field socks:[Lcom/beyond/io/Requester;

.field txbuf:[B

.field waiter:Lcom/beyond/io/SerialStack$Waiter;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 867
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 857
    const/16 v0, 0x434

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B

    .line 858
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/beyond/io/Requester;

    iput-object v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    .line 863
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->closed:Z

    .line 864
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->notified:Z

    .line 865
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->event:[I

    .line 867
    return-void
.end method

.method constructor <init>(ILcom/beyond/io/SerialStack$Waiter;)V
    .locals 4
    .param p1, "fd"    # I
    .param p2, "waiter"    # Lcom/beyond/io/SerialStack$Waiter;

    .prologue
    const/4 v3, 0x0

    .line 869
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 857
    const/16 v1, 0x434

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B

    .line 858
    const/16 v1, 0xa

    new-array v1, v1, [Lcom/beyond/io/Requester;

    iput-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    .line 863
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->closed:Z

    .line 864
    iput-boolean v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->notified:Z

    .line 865
    const/4 v1, 0x4

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->event:[I

    .line 870
    iput-object p2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->waiter:Lcom/beyond/io/SerialStack$Waiter;

    .line 871
    iput p1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->fd:I

    .line 872
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 875
    iput-boolean v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->closed:Z

    .line 876
    iput-boolean v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->notified:Z

    .line 877
    new-instance v1, Lcom/beyond/io/SerialStack$Terminator;

    invoke-direct {v1}, Lcom/beyond/io/SerialStack$Terminator;-><init>()V

    invoke-virtual {v1}, Lcom/beyond/io/SerialStack$Terminator;->start()V

    .line 878
    return-void

    .line 873
    :cond_0
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 872
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 881
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v1

    .line 882
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->closed:Z

    .line 883
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->notified:Z

    .line 884
    iget-object v0, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 881
    monitor-exit v1

    .line 886
    return-void

    .line 881
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method closeRequestingRequester(I)V
    .locals 6
    .param p1, "fd"    # I

    .prologue
    .line 967
    :try_start_0
    iget-object v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 968
    :try_start_1
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v1, v3, p1

    .line 969
    .local v1, "req":Lcom/beyond/io/Requester;
    if-nez v1, :cond_0

    .line 970
    monitor-exit v4

    .line 995
    .end local v1    # "req":Lcom/beyond/io/Requester;
    :goto_0
    return-void

    .line 972
    .restart local v1    # "req":Lcom/beyond/io/Requester;
    :cond_0
    const/4 v2, 0x0

    .line 973
    .local v2, "sreq":Lcom/beyond/io/SocketRequester;
    instance-of v3, v1, Lcom/beyond/io/SocketRequester;

    if-nez v3, :cond_1

    .line 974
    move-object v0, v1

    check-cast v0, Lcom/beyond/io/SocketRequester;

    move-object v3, v0

    iget-object v2, v3, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 976
    :cond_1
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    const/4 v5, 0x0

    aput-object v5, v3, p1

    .line 977
    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 978
    const/4 v3, -0x1

    :try_start_2
    iput v3, v1, Lcom/beyond/io/Requester;->ret:I

    .line 979
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/beyond/io/Requester;->waken:Z

    .line 980
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/beyond/io/Requester;->requesting:Z

    .line 982
    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 977
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 984
    if-eqz v2, :cond_2

    .line 985
    :try_start_3
    monitor-enter v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 986
    const/4 v3, -0x1

    :try_start_4
    iput v3, v2, Lcom/beyond/io/SocketRequester;->ret:I

    .line 987
    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/beyond/io/SocketRequester;->waken:Z

    .line 988
    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/beyond/io/SocketRequester;->requesting:Z

    .line 989
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 985
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 967
    :cond_2
    :try_start_5
    monitor-exit v4

    goto :goto_0

    .end local v1    # "req":Lcom/beyond/io/Requester;
    .end local v2    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v3
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 993
    :catch_0
    move-exception v3

    goto :goto_0

    .line 977
    .restart local v1    # "req":Lcom/beyond/io/Requester;
    .restart local v2    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_1
    move-exception v3

    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 985
    :catchall_2
    move-exception v3

    :try_start_9
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
.end method

.method findRequestingRequester(II)Lcom/beyond/io/Requester;
    .locals 5
    .param p1, "cmd"    # I
    .param p2, "fd"    # I

    .prologue
    const/4 v2, 0x0

    .line 1034
    iget-object v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v4

    .line 1036
    packed-switch p1, :pswitch_data_0

    .line 1038
    :pswitch_0
    :try_start_0
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v1, v3, p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1086
    :goto_0
    return-object v1

    .line 1042
    :pswitch_1
    :try_start_2
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v1, v3, p2

    check-cast v1, Lcom/beyond/io/SocketRequester;

    .line 1043
    .local v1, "sreq":Lcom/beyond/io/SocketRequester;
    monitor-enter v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1044
    :try_start_3
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->input:Z

    if-eqz v3, :cond_1

    .line 1045
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->requesting:Z

    if-nez v3, :cond_0

    .line 1046
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1048
    :cond_0
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    monitor-exit v4

    goto :goto_0

    .line 1034
    .end local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v2

    .line 1043
    .restart local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :cond_1
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 1052
    :try_start_8
    iget-object v1, v1, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 1053
    monitor-enter v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1054
    :try_start_9
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->input:Z

    if-eqz v3, :cond_3

    .line 1055
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->requesting:Z

    if-nez v3, :cond_2

    .line 1056
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1043
    :catchall_1
    move-exception v3

    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :try_start_c
    throw v3
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 1085
    .end local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :catch_0
    move-exception v0

    .line 1086
    .local v0, "ne":Ljava/lang/Exception;
    :try_start_d
    monitor-exit v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1058
    .end local v0    # "ne":Ljava/lang/Exception;
    .restart local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :cond_2
    :try_start_e
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    :try_start_f
    monitor-exit v4
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    goto :goto_0

    .line 1053
    :cond_3
    :try_start_10
    monitor-exit v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 1061
    :try_start_11
    monitor-exit v4
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1053
    :catchall_2
    move-exception v3

    :try_start_12
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    :try_start_13
    throw v3

    .line 1064
    .end local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :pswitch_2
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v1, v3, p2

    check-cast v1, Lcom/beyond/io/SocketRequester;

    .line 1065
    .restart local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    monitor-enter v1
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_0
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 1066
    :try_start_14
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->input:Z

    if-nez v3, :cond_5

    .line 1067
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->requesting:Z

    if-nez v3, :cond_4

    .line 1068
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    :try_start_15
    monitor-exit v4
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1070
    :cond_4
    :try_start_16
    monitor-exit v1
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    :try_start_17
    monitor-exit v4
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    goto :goto_0

    .line 1065
    :cond_5
    :try_start_18
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    .line 1074
    :try_start_19
    iget-object v1, v1, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 1075
    monitor-enter v1
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_0
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    .line 1076
    :try_start_1a
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->input:Z

    if-nez v3, :cond_7

    .line 1077
    iget-boolean v3, v1, Lcom/beyond/io/SocketRequester;->requesting:Z

    if-nez v3, :cond_6

    .line 1078
    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4

    :try_start_1b
    monitor-exit v4
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1065
    :catchall_3
    move-exception v3

    :try_start_1c
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_3

    :try_start_1d
    throw v3
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_0
    .catchall {:try_start_1d .. :try_end_1d} :catchall_0

    .line 1080
    :cond_6
    :try_start_1e
    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_4

    :try_start_1f
    monitor-exit v4
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_0

    goto :goto_0

    .line 1075
    :cond_7
    :try_start_20
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_4

    .line 1083
    :try_start_21
    monitor-exit v4
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1075
    :catchall_4
    move-exception v3

    :try_start_22
    monitor-exit v1
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_4

    :try_start_23
    throw v3
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_0
    .catchall {:try_start_23 .. :try_end_23} :catchall_0

    .line 1036
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public register(Lcom/beyond/io/Requester;I)I
    .locals 4
    .param p1, "req"    # Lcom/beyond/io/Requester;
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1259
    if-nez p1, :cond_0

    .line 1260
    const/4 v1, -0x1

    .line 1304
    :goto_0
    return v1

    .line 1262
    :cond_0
    monitor-enter p1

    .line 1263
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p1, Lcom/beyond/io/Requester;->requesting:Z

    .line 1262
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1266
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v2

    .line 1278
    :try_start_1
    iget-object v1, p1, Lcom/beyond/io/Requester;->buf:[B

    invoke-virtual {p0, v1, p2}, Lcom/beyond/io/SerialStack$serialWatcher;->writeSerial([BI)V

    .line 1279
    const/4 v1, 0x0

    iput-boolean v1, p1, Lcom/beyond/io/Requester;->waken:Z

    .line 1282
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->notified:Z

    .line 1283
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 1287
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    iget v3, p1, Lcom/beyond/io/Requester;->fd:I

    aget-object v1, v1, v3

    if-nez v1, :cond_1

    .line 1288
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    iget v3, p1, Lcom/beyond/io/Requester;->fd:I

    aput-object p1, v1, v3

    .line 1266
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1293
    monitor-enter p1

    .line 1294
    :try_start_2
    iget-boolean v1, p1, Lcom/beyond/io/Requester;->waken:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-nez v1, :cond_2

    .line 1296
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1301
    :cond_2
    const/4 v1, 0x0

    :try_start_4
    iput-boolean v1, p1, Lcom/beyond/io/Requester;->requesting:Z

    .line 1293
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1304
    iget v1, p1, Lcom/beyond/io/Requester;->ret:I

    goto :goto_0

    .line 1262
    :catchall_0
    move-exception v1

    :try_start_5
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v1

    .line 1266
    :catchall_1
    move-exception v1

    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1

    .line 1297
    :catch_0
    move-exception v0

    .line 1298
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    new-instance v1, Ljava/io/IOException;

    const-string v2, "requester wait fail"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1293
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2
    move-exception v1

    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v1
.end method

.method removeRequestingRequester(Lcom/beyond/io/Requester;I)V
    .locals 5
    .param p1, "req"    # Lcom/beyond/io/Requester;
    .param p2, "fd"    # I

    .prologue
    .line 998
    instance-of v1, p1, Lcom/beyond/io/SocketRequester;

    if-nez v1, :cond_0

    .line 999
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v2

    .line 1000
    :try_start_0
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    const/4 v3, 0x0

    aput-object v3, v1, p2

    .line 999
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1022
    :goto_0
    :try_start_1
    monitor-enter p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1023
    const/4 v1, 0x1

    :try_start_2
    iput-boolean v1, p1, Lcom/beyond/io/Requester;->waken:Z

    .line 1024
    const/4 v1, 0x0

    iput-boolean v1, p1, Lcom/beyond/io/Requester;->requesting:Z

    .line 1025
    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 1022
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 1029
    :goto_1
    return-void

    .line 999
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    :cond_0
    move-object v0, p1

    .line 1003
    check-cast v0, Lcom/beyond/io/SocketRequester;

    .line 1004
    .local v0, "sreq":Lcom/beyond/io/SocketRequester;
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v2

    .line 1005
    :try_start_4
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v1, v1, p2

    if-ne v1, v0, :cond_1

    .line 1006
    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    if-eqz v1, :cond_3

    .line 1007
    iget-object v3, v0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    monitor-enter v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1008
    :try_start_5
    iget-object v1, v0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    iget-boolean v1, v1, Lcom/beyond/io/SocketRequester;->requesting:Z

    if-eqz v1, :cond_2

    .line 1009
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    iget-object v4, v0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    aput-object v4, v1, p2

    .line 1007
    :goto_2
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 1004
    :cond_1
    :goto_3
    :try_start_6
    monitor-exit v2

    goto :goto_0

    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v1

    .line 1011
    :cond_2
    :try_start_7
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    const/4 v4, 0x0

    aput-object v4, v1, p2

    goto :goto_2

    .line 1007
    :catchall_2
    move-exception v1

    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v1

    .line 1015
    :cond_3
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    const/4 v3, 0x0

    aput-object v3, v1, p2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_3

    .line 1022
    .end local v0    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_3
    move-exception v1

    :try_start_9
    monitor-exit p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :try_start_a
    throw v1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 1027
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public run()V
    .locals 5

    .prologue
    .line 910
    const/4 v0, 0x0

    .line 912
    .local v0, "waiterchk":Z
    :goto_0
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v2

    .line 914
    if-nez v0, :cond_0

    .line 915
    :try_start_0
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->waiter:Lcom/beyond/io/SerialStack$Waiter;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 916
    :try_start_1
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->waiter:Lcom/beyond/io/SerialStack$Waiter;

    const/4 v4, 0x1

    iput-boolean v4, v1, Lcom/beyond/io/SerialStack$Waiter;->aheadok:Z

    .line 917
    iget-object v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->waiter:Lcom/beyond/io/SerialStack$Waiter;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 918
    const/4 v0, 0x1

    .line 915
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 921
    :cond_0
    :try_start_2
    iget-boolean v1, p0, Lcom/beyond/io/SerialStack$serialWatcher;->closed:Z

    if-eqz v1, :cond_1

    .line 922
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 935
    invoke-virtual {p0}, Lcom/beyond/io/SerialStack$serialWatcher;->wakeupall()V

    .line 936
    return-void

    .line 915
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1

    .line 912
    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1

    :cond_1
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0
.end method

.method wakeupall()V
    .locals 6

    .prologue
    .line 939
    iget-object v3, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    monitor-enter v3

    .line 940
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 939
    monitor-exit v3

    .line 962
    return-void

    .line 941
    :cond_0
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    .line 942
    const/4 v1, 0x0

    .line 943
    .local v1, "sreq":Lcom/beyond/io/SocketRequester;
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v2, v2, v0

    instance-of v2, v2, Lcom/beyond/io/SocketRequester;

    if-eqz v2, :cond_1

    .line 944
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v2, v2, v0

    check-cast v2, Lcom/beyond/io/SocketRequester;

    iget-object v1, v2, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 946
    :cond_1
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v4, v2, v0

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 947
    :try_start_1
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v2, v2, v0

    const/4 v5, -0x1

    iput v5, v2, Lcom/beyond/io/Requester;->ret:I

    .line 948
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 949
    iget-object v2, p0, Lcom/beyond/io/SerialStack$serialWatcher;->socks:[Lcom/beyond/io/Requester;

    const/4 v5, 0x0

    aput-object v5, v2, v0

    .line 946
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 951
    if-eqz v1, :cond_2

    .line 952
    :try_start_2
    monitor-enter v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 953
    const/4 v2, -0x1

    :try_start_3
    iput v2, v1, Lcom/beyond/io/SocketRequester;->ret:I

    .line 954
    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 952
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 940
    .end local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 946
    .restart local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v2

    .line 939
    .end local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v2

    .line 952
    .restart local v1    # "sreq":Lcom/beyond/io/SocketRequester;
    :catchall_2
    move-exception v2

    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :try_start_7
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1
.end method

.method declared-synchronized writeSerial([BI)V
    .locals 8
    .param p1, "data"    # [B
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x7e

    const/16 v6, 0x7d

    .line 890
    monitor-enter p0

    const/4 v2, 0x0

    .line 891
    .local v2, "txp":I
    const/4 v1, 0x0

    .local v1, "i":I
    move v3, v2

    .end local v2    # "txp":I
    .local v3, "txp":I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 905
    :try_start_0
    iget-object v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "txp":I
    .restart local v2    # "txp":I
    const/16 v5, 0x7e

    :try_start_1
    aput-byte v5, v4, v3

    .line 906
    iget v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->fd:I

    iget-object v5, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B

    invoke-static {v4, v5, v2}, Lcom/beyond/io/SerialStack;->nativeSerialWrite(I[BI)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 907
    monitor-exit p0

    return-void

    .line 892
    .end local v2    # "txp":I
    .restart local v3    # "txp":I
    :cond_0
    :try_start_2
    aget-byte v4, p1, v1

    and-int/lit16 v0, v4, 0xff

    .line 893
    .local v0, "ch":I
    if-eq v0, v7, :cond_1

    if-ne v0, v6, :cond_2

    .line 895
    :cond_1
    iget-object v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "txp":I
    .restart local v2    # "txp":I
    const/16 v5, 0x7d

    :try_start_3
    aput-byte v5, v4, v3

    .line 896
    xor-int/lit8 v0, v0, 0x20

    .line 898
    iget-object v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "txp":I
    .restart local v3    # "txp":I
    int-to-byte v5, v0

    :try_start_4
    aput-byte v5, v4, v2

    move v2, v3

    .line 891
    .end local v3    # "txp":I
    .restart local v2    # "txp":I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    move v3, v2

    .end local v2    # "txp":I
    .restart local v3    # "txp":I
    goto :goto_0

    .line 901
    :cond_2
    iget-object v4, p0, Lcom/beyond/io/SerialStack$serialWatcher;->txbuf:[B
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "txp":I
    .restart local v2    # "txp":I
    int-to-byte v5, v0

    :try_start_5
    aput-byte v5, v4, v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 890
    .end local v0    # "ch":I
    :catchall_0
    move-exception v4

    :goto_2
    monitor-exit p0

    throw v4

    .end local v2    # "txp":I
    .restart local v3    # "txp":I
    :catchall_1
    move-exception v4

    move v2, v3

    .end local v3    # "txp":I
    .restart local v2    # "txp":I
    goto :goto_2
.end method
