.class public Lcom/beyond/io/serversocket;
.super Lcom/beyond/io/SocketModel;
.source "serversocket.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# instance fields
.field fd:I

.field localip:I

.field localport:S

.field mode:I

.field opened:Z

.field port:I

.field timeout:I

.field wire:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/beyond/io/serversocket;-><init>(Z)V

    .line 37
    return-void
.end method

.method constructor <init>(Z)V
    .locals 2
    .param p1, "wire"    # Z

    .prologue
    const/4 v1, 0x0

    .line 39
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 16
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/serversocket;->localip:I

    .line 17
    iput-short v1, p0, Lcom/beyond/io/serversocket;->localport:S

    .line 19
    iput-boolean v1, p0, Lcom/beyond/io/serversocket;->opened:Z

    .line 20
    iput-boolean v1, p0, Lcom/beyond/io/serversocket;->wire:Z

    .line 40
    iput-boolean p1, p0, Lcom/beyond/io/serversocket;->wire:Z

    .line 41
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
    .line 144
    iget-boolean v0, p0, Lcom/beyond/io/serversocket;->opened:Z

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Ljava/io/IOException;

    const-string v1, "server socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_0
    return-void
.end method

.method private toInt(Ljava/lang/String;ILjava/lang/String;)I
    .locals 3
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "radix"    # I
    .param p3, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 26
    const/4 v1, 0x0

    .line 28
    .local v1, "val":I
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 32
    return v1

    .line 29
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public accept()Lorg/kwis/msf/io/Socket;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/beyond/io/serversocket;->checkOpened()V

    .line 169
    iget-boolean v2, p0, Lcom/beyond/io/serversocket;->wire:Z

    if-eqz v2, :cond_0

    .line 170
    iget v2, p0, Lcom/beyond/io/serversocket;->fd:I

    iget v3, p0, Lcom/beyond/io/serversocket;->mode:I

    iget v4, p0, Lcom/beyond/io/serversocket;->timeout:I

    invoke-static {v2, v3, v4}, Lcom/beyond/io/SerialStack;->accept(III)Lcom/beyond/io/socket;

    move-result-object v1

    .line 195
    :goto_0
    return-object v1

    .line 179
    :cond_0
    :goto_1
    iget v2, p0, Lcom/beyond/io/serversocket;->fd:I

    invoke-virtual {p0, v2}, Lcom/beyond/io/serversocket;->sockaccept(I)I

    move-result v0

    .line 183
    .local v0, "sd":I
    const/4 v2, -0x2

    if-ne v0, v2, :cond_1

    .line 184
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_1

    .line 187
    :cond_1
    if-gez v0, :cond_2

    .line 188
    new-instance v2, Ljava/io/InterruptedIOException;

    const-string v3, "server socket accept fail"

    invoke-direct {v2, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 193
    :cond_2
    new-instance v1, Lcom/beyond/io/socket;

    invoke-direct {v1}, Lcom/beyond/io/socket;-><init>()V

    .line 194
    .local v1, "so":Lcom/beyond/io/socket;
    iget v2, p0, Lcom/beyond/io/serversocket;->mode:I

    iget v3, p0, Lcom/beyond/io/serversocket;->timeout:I

    invoke-virtual {v1, v0, v2, v3}, Lcom/beyond/io/socket;->open(III)V

    goto :goto_0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/beyond/io/serversocket;->opened:Z

    if-eqz v0, :cond_0

    .line 203
    iget-boolean v0, p0, Lcom/beyond/io/serversocket;->wire:Z

    if-eqz v0, :cond_1

    .line 204
    iget v0, p0, Lcom/beyond/io/serversocket;->fd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->close(I)V

    .line 208
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/serversocket;->opened:Z

    .line 209
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/serversocket;->fd:I

    .line 211
    :cond_0
    return-void

    .line 206
    :cond_1
    iget v0, p0, Lcom/beyond/io/serversocket;->fd:I

    invoke-virtual {p0, v0}, Lcom/beyond/io/serversocket;->sockclose(I)V

    goto :goto_0
.end method

.method public getLocalAddress()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget v0, p0, Lcom/beyond/io/serversocket;->localip:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 150
    new-instance v0, Ljava/io/IOException;

    const-string v1, "dunno"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/beyond/io/serversocket;->localip:I

    ushr-int/lit8 v1, v1, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 153
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/beyond/io/serversocket;->localip:I

    ushr-int/lit8 v1, v1, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 154
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/beyond/io/serversocket;->localip:I

    ushr-int/lit8 v1, v1, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 155
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/beyond/io/serversocket;->localip:I

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    iget-short v0, p0, Lcom/beyond/io/serversocket;->localport:S

    return v0
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 214
    const/4 v0, 0x1

    return v0
.end method

.method open(III)V
    .locals 4
    .param p1, "port"    # I
    .param p2, "mode"    # I
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 122
    iget-boolean v1, p0, Lcom/beyond/io/serversocket;->opened:Z

    if-eqz v1, :cond_0

    .line 123
    new-instance v1, Ljava/io/IOException;

    const-string v2, "serversocket is already opened"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_0
    iget-boolean v1, p0, Lcom/beyond/io/serversocket;->wire:Z

    if-nez v1, :cond_1

    .line 125
    invoke-virtual {p0, p1, p3}, Lcom/beyond/io/serversocket;->sockopen(II)I

    move-result v1

    iput v1, p0, Lcom/beyond/io/serversocket;->fd:I

    .line 138
    :goto_0
    iput p2, p0, Lcom/beyond/io/serversocket;->mode:I

    .line 139
    iput p3, p0, Lcom/beyond/io/serversocket;->timeout:I

    .line 140
    iput-boolean v3, p0, Lcom/beyond/io/serversocket;->opened:Z

    .line 141
    return-void

    .line 127
    :cond_1
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 128
    .local v0, "portb":[B
    int-to-short v1, p1

    invoke-static {v1, v0}, Lcom/beyond/io/SerialStack;->listen(S[B)I

    move-result v1

    iput v1, p0, Lcom/beyond/io/serversocket;->fd:I

    .line 132
    const v1, 0x7f000001

    iput v1, p0, Lcom/beyond/io/serversocket;->localip:I

    .line 134
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    .line 135
    aget-byte v2, v0, v3

    and-int/lit16 v2, v2, 0xff

    .line 133
    or-int/2addr v1, v2

    int-to-short v1, v1

    iput-short v1, p0, Lcom/beyond/io/serversocket;->localport:S

    goto :goto_0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 12
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v10, -0x1

    const/4 v9, 0x1

    const/16 v8, 0x2f

    const/4 v7, 0x0

    .line 58
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_0

    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v8, :cond_1

    .line 59
    :cond_0
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "bad URI: \"//\" omitted"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 65
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 66
    .local v2, "len":I
    const/16 v5, 0x3a

    invoke-virtual {p1, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 67
    .local v1, "idx":I
    if-lez v1, :cond_2

    sub-int v5, v2, v1

    const/4 v6, 0x5

    if-ne v5, v6, :cond_2

    .line 68
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, ":wire"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 69
    iput-boolean v9, p0, Lcom/beyond/io/serversocket;->wire:Z

    .line 70
    invoke-virtual {p1, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 78
    :cond_2
    invoke-virtual {p1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, "portstr":Ljava/lang/String;
    invoke-virtual {v3, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 82
    if-eq v1, v10, :cond_7

    .line 83
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 84
    .local v4, "str":Ljava/lang/String;
    const/16 v5, 0xa

    const-string v6, "bad URI: bad timeout"

    invoke-direct {p0, v4, v5, v6}, Lcom/beyond/io/serversocket;->toInt(Ljava/lang/String;ILjava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/beyond/io/serversocket;->timeout:I

    .line 85
    invoke-virtual {v3, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 88
    invoke-virtual {v3, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 89
    if-ne v1, v10, :cond_3

    .line 90
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "bad URI: no mode"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 92
    :cond_3
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 93
    const-string v5, "r"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 94
    iput v9, p0, Lcom/beyond/io/serversocket;->mode:I

    .line 102
    :goto_0
    invoke-virtual {v3, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 109
    .end local v4    # "str":Ljava/lang/String;
    :goto_1
    const/16 v5, 0xa

    const-string v6, "bad URI: no decimal port"

    invoke-direct {p0, v3, v5, v6}, Lcom/beyond/io/serversocket;->toInt(Ljava/lang/String;ILjava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/beyond/io/serversocket;->port:I

    .line 111
    iget v5, p0, Lcom/beyond/io/serversocket;->port:I

    if-gez v5, :cond_8

    .line 112
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "bad URI: bad port number "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 112
    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 95
    .restart local v4    # "str":Ljava/lang/String;
    :cond_4
    const-string v5, "w"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 96
    iput v11, p0, Lcom/beyond/io/serversocket;->mode:I

    goto :goto_0

    .line 97
    :cond_5
    const-string v5, "rw"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 98
    const/4 v5, 0x3

    iput v5, p0, Lcom/beyond/io/serversocket;->mode:I

    goto :goto_0

    .line 100
    :cond_6
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "bad URI: bad mode"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 105
    .end local v4    # "str":Ljava/lang/String;
    :cond_7
    const/4 v5, 0x3

    iput v5, p0, Lcom/beyond/io/serversocket;->mode:I

    .line 106
    iput v7, p0, Lcom/beyond/io/serversocket;->timeout:I

    goto :goto_1

    .line 115
    :cond_8
    iget v5, p0, Lcom/beyond/io/serversocket;->port:I

    iget v6, p0, Lcom/beyond/io/serversocket;->mode:I

    iget v7, p0, Lcom/beyond/io/serversocket;->timeout:I

    invoke-virtual {p0, v5, v6, v7}, Lcom/beyond/io/serversocket;->open(III)V

    .line 117
    return-object p0
.end method

.method protected native sockaccept(I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected native sockclose(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected native sockopen(II)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
