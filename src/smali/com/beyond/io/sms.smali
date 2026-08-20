.class public Lcom/beyond/io/sms;
.super Lcom/beyond/io/SocketModel;
.source "sms.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# static fields
.field private static final MODE_DELREAD:I = 0x1

.field private static final MODE_READ:I = 0x0

.field private static final MODE_SEND:I = 0x2


# instance fields
.field private address:Ljava/lang/String;

.field private fd:I

.field private mode:I

.field private opened:Z

.field private telID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/sms;->opened:Z

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/sms;->telID:Ljava/lang/String;

    .line 13
    return-void
.end method

.method private checkOpened()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/beyond/io/sms;->opened:Z

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Ljava/io/IOException;

    const-string v1, "datagram socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_0
    return-void
.end method

.method private native close0(I)V
.end method

.method private native getMaximumLength0(Ljava/lang/String;)I
.end method

.method private native open0(Ljava/lang/String;I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method private native recv0(I[B[BI[B)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method private native send0(Ljava/lang/String;Ljava/lang/String;[BI)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/beyond/io/sms;->opened:Z

    if-eqz v0, :cond_1

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/sms;->opened:Z

    .line 76
    iget v0, p0, Lcom/beyond/io/sms;->mode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 77
    iget v0, p0, Lcom/beyond/io/sms;->fd:I

    invoke-direct {p0, v0}, Lcom/beyond/io/sms;->close0(I)V

    .line 79
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/sms;->fd:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :cond_1
    monitor-exit p0

    return-void

    .line 74
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMaximumLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/beyond/io/sms;->checkOpened()V

    .line 90
    iget-object v0, p0, Lcom/beyond/io/sms;->telID:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/beyond/io/sms;->getMaximumLength0(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getNominalLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/beyond/io/sms;->checkOpened()V

    .line 100
    invoke-virtual {p0}, Lcom/beyond/io/sms;->getMaximumLength()I

    move-result v0

    return v0
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 161
    const/4 v0, 0x0

    return v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 9
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x2f

    const/4 v7, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    .line 30
    const/4 v3, 0x0

    .line 34
    .local v3, "portstr":Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v8, :cond_0

    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v8, :cond_1

    .line 35
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "bad URI: \"//\" omitted"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 40
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    const/16 v4, 0x3a

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 41
    .local v2, "ndx":I
    if-gez v2, :cond_2

    .line 42
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "bad URI: \':\' expected before mode"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 44
    :cond_2
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "modestr":Ljava/lang/String;
    const-string v4, "read"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 46
    iput v7, p0, Lcom/beyond/io/sms;->mode:I

    .line 55
    :goto_0
    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/io/sms;->telID:Ljava/lang/String;

    .line 57
    iget v4, p0, Lcom/beyond/io/sms;->mode:I

    if-eq v4, v5, :cond_3

    .line 59
    iget-object v4, p0, Lcom/beyond/io/sms;->telID:Ljava/lang/String;

    iget v5, p0, Lcom/beyond/io/sms;->mode:I

    invoke-direct {p0, v4, v5}, Lcom/beyond/io/sms;->open0(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/beyond/io/sms;->fd:I

    .line 63
    :cond_3
    iput-boolean v6, p0, Lcom/beyond/io/sms;->opened:Z

    .line 64
    return-object p0

    .line 47
    :cond_4
    const-string v4, "delread"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 48
    iput v6, p0, Lcom/beyond/io/sms;->mode:I

    goto :goto_0

    .line 49
    :cond_5
    const-string v4, "send"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 50
    iput v5, p0, Lcom/beyond/io/sms;->mode:I

    goto :goto_0

    .line 52
    :cond_6
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "bad URI: unkown mode"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public declared-synchronized recv(Lorg/kwis/msf/io/Message;)V
    .locals 8
    .param p1, "msg"    # Lorg/kwis/msf/io/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/beyond/io/sms;->checkOpened()V

    .line 122
    iget v0, p0, Lcom/beyond/io/sms;->mode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 123
    new-instance v0, Ljava/io/IOException;

    const-string v1, "opertation not permitted"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 126
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v3

    .line 127
    .local v3, "data":[B
    if-nez v3, :cond_1

    .line 128
    new-instance v0, Ljava/io/IOException;

    const-string v1, "buffer null"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_1
    const/16 v0, 0x10

    new-array v2, v0, [B

    .line 133
    .local v2, "addrbuf":[B
    const/4 v0, 0x6

    new-array v5, v0, [B

    .line 136
    .local v5, "datebuf":[B
    iget v1, p0, Lcom/beyond/io/sms;->fd:I

    array-length v4, v3

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/beyond/io/sms;->recv0(I[B[BI[B)I

    move-result v7

    .line 143
    .local v7, "ret":I
    array-length v0, v3

    invoke-virtual {p1, v0}, Lorg/kwis/msf/io/Message;->setLength(I)I

    .line 147
    const-string v0, ""

    iput-object v0, p0, Lcom/beyond/io/sms;->address:Ljava/lang/String;

    .line 148
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v0, v2

    if-lt v6, v0, :cond_3

    .line 154
    :cond_2
    iget-object v0, p0, Lcom/beyond/io/sms;->address:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/kwis/msf/io/Message;->setAddress(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 158
    monitor-exit p0

    return-void

    .line 149
    :cond_3
    :try_start_2
    aget-byte v0, v2, v6

    if-nez v0, :cond_2

    .line 152
    iget-object v0, p0, Lcom/beyond/io/sms;->address:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-byte v0, v2, v6

    int-to-char v0, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/io/sms;->address:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method public declared-synchronized send(Lorg/kwis/msf/io/Message;)V
    .locals 4
    .param p1, "msg"    # Lorg/kwis/msf/io/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/beyond/io/sms;->checkOpened()V

    .line 109
    iget v1, p0, Lcom/beyond/io/sms;->mode:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 110
    new-instance v1, Ljava/io/IOException;

    const-string v2, "opertation not permitted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 112
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "addr":Ljava/lang/String;
    iget-object v1, p0, Lcom/beyond/io/sms;->telID:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v2

    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v3

    invoke-direct {p0, v1, v0, v2, v3}, Lcom/beyond/io/sms;->send0(Ljava/lang/String;Ljava/lang/String;[BI)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    monitor-exit p0

    return-void
.end method
