.class public Lcom/beyond/io/datagram;
.super Lcom/beyond/io/SocketModel;
.source "datagram.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# instance fields
.field private address:Ljava/lang/String;

.field fd:I

.field private mSocket:Ljava/net/DatagramSocket;

.field private mode:I

.field opened:Z

.field private port:I

.field wire:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/beyond/io/datagram;->opened:Z

    .line 20
    iput-boolean v0, p0, Lcom/beyond/io/datagram;->wire:Z

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    .line 14
    return-void
.end method

.method private bytesToInt([BI)I
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "start"    # I

    .prologue
    .line 442
    add-int/lit8 v1, p2, 0x3

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    .line 443
    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    .line 442
    or-int/2addr v1, v2

    .line 443
    aget-byte v2, p1, p2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x18

    .line 442
    or-int v0, v1, v2

    .line 444
    .local v0, "value":I
    return v0
.end method

.method private checkOpened()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->opened:Z

    if-nez v0, :cond_0

    .line 137
    new-instance v0, Ljava/io/IOException;

    const-string v1, "datagram socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_0
    return-void
.end method

.method private getMaximumLengthx(I)I
    .locals 1
    .param p1, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 421
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getSendBufferSize()I

    move-result v0

    return v0
.end method

.method private sockclose(I)V
    .locals 1
    .param p1, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 417
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 418
    return-void
.end method

.method private sockopen(II)I
    .locals 1
    .param p1, "port"    # I
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 408
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    if-nez v0, :cond_0

    .line 409
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-direct {v0}, Ljava/net/DatagramSocket;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    .line 410
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p2}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 413
    :cond_0
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method private sockrecv(Ljava/net/DatagramPacket;)I
    .locals 1
    .param p1, "pack"    # Ljava/net/DatagramPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 430
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 431
    invoke-virtual {p1}, Ljava/net/DatagramPacket;->getLength()I

    move-result v0

    return v0
.end method

.method private socksend(Ljava/net/DatagramPacket;)I
    .locals 1
    .param p1, "pack"    # Ljava/net/DatagramPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 425
    iget-object v0, p0, Lcom/beyond/io/datagram;->mSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 426
    const/4 v0, 0x0

    return v0
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
.method public checkOpenedDatagram()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->opened:Z

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Ljava/io/IOException;

    const-string v1, "datagram socket closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_0
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->opened:Z

    if-eqz v0, :cond_0

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/datagram;->opened:Z

    .line 149
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->wire:Z

    if-nez v0, :cond_1

    .line 150
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-direct {p0, v0}, Lcom/beyond/io/datagram;->sockclose(I)V

    .line 154
    :goto_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/datagram;->fd:I

    .line 156
    :cond_0
    return-void

    .line 152
    :cond_1
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->close(I)V

    goto :goto_0
.end method

.method protected native getHost0(I)I
.end method

.method public getLocalAddress()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    invoke-direct {p0}, Lcom/beyond/io/datagram;->checkOpened()V

    .line 190
    const-string v3, "microedition.hostname"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "hostname":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 209
    .end local v0    # "hostname":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 195
    .restart local v0    # "hostname":Ljava/lang/String;
    :cond_0
    iget v3, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-virtual {p0, v3}, Lcom/beyond/io/datagram;->getHost0(I)I

    move-result v2

    .line 198
    .local v2, "ret":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 199
    const/4 v0, 0x0

    goto :goto_0

    .line 203
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    shr-int/lit8 v4, v2, 0x18

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 205
    shr-int/lit8 v4, v2, 0x10

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 206
    shr-int/lit8 v4, v2, 0x8

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 207
    and-int/lit16 v4, v2, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 203
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "localAddress":Ljava/lang/String;
    move-object v0, v1

    .line 209
    goto :goto_0
.end method

.method public getLocalPort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-direct {p0}, Lcom/beyond/io/datagram;->checkOpened()V

    .line 217
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-virtual {p0, v0}, Lcom/beyond/io/datagram;->getPort0(I)I

    move-result v0

    return v0
.end method

.method public getMessageCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    const/4 v0, -0x1

    return v0
.end method

.method public getMessageMaxLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/beyond/io/datagram;->checkOpened()V

    .line 165
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->wire:Z

    if-nez v0, :cond_0

    .line 166
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-direct {p0, v0}, Lcom/beyond/io/datagram;->getMaximumLengthx(I)I

    move-result v0

    .line 168
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->getMaximumLength(I)I

    move-result v0

    goto :goto_0
.end method

.method public getNominalLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-direct {p0}, Lcom/beyond/io/datagram;->checkOpened()V

    .line 179
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->wire:Z

    if-nez v0, :cond_0

    .line 180
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-virtual {p0, v0}, Lcom/beyond/io/datagram;->getNominalLengthx(I)I

    move-result v0

    .line 182
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    invoke-static {v0}, Lcom/beyond/io/SerialStack;->getNominalLength(I)I

    move-result v0

    goto :goto_0
.end method

.method protected native getNominalLengthx(I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected native getPort0(I)I
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 399
    const/4 v0, 0x0

    return v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 11
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    const/4 v5, 0x0

    .line 51
    .local v5, "portstr":Ljava/lang/String;
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x2f

    if-ne v8, v9, :cond_0

    const/4 v8, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x2f

    if-eq v8, v9, :cond_1

    .line 52
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "bad URI: \"//\" omitted"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 58
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 59
    .local v3, "len":I
    const/16 v8, 0x3a

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 60
    .local v2, "idx":I
    if-lez v2, :cond_2

    sub-int v8, v3, v2

    const/4 v9, 0x5

    if-ne v8, v9, :cond_2

    .line 61
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, ":wire"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 62
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/beyond/io/datagram;->wire:Z

    .line 63
    const/4 v8, 0x0

    invoke-virtual {p1, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 67
    :cond_2
    const/16 v8, 0x3a

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 69
    .local v4, "ndx":I
    const/4 v8, -0x1

    if-ne v4, v8, :cond_3

    .line 70
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "bad URI: \':\' expected before port"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 74
    :cond_3
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 77
    const/16 v8, 0x2f

    invoke-virtual {v5, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 78
    const/4 v8, -0x1

    if-eq v2, v8, :cond_8

    .line 79
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 80
    .local v6, "str":Ljava/lang/String;
    const/16 v8, 0xa

    const-string v9, "bad URI: bad timeout"

    invoke-direct {p0, v6, v8, v9}, Lcom/beyond/io/datagram;->toInt(Ljava/lang/String;ILjava/lang/String;)I

    move-result v7

    .line 81
    .local v7, "timeouts":I
    const/4 v8, 0x0

    invoke-virtual {v5, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 84
    const/16 v8, 0x2f

    invoke-virtual {v5, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 85
    const/4 v8, -0x1

    if-ne v2, v8, :cond_4

    .line 86
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "bad URI: no mode"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 88
    :cond_4
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 89
    const-string v8, "r"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 90
    const/4 v8, 0x1

    iput v8, p0, Lcom/beyond/io/datagram;->mode:I

    .line 98
    :goto_0
    const/4 v8, 0x0

    invoke-virtual {v5, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 105
    .end local v6    # "str":Ljava/lang/String;
    :goto_1
    const/16 v8, 0xa

    const-string v9, "bad URI: no decimal port"

    invoke-direct {p0, v5, v8, v9}, Lcom/beyond/io/datagram;->toInt(Ljava/lang/String;ILjava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/beyond/io/datagram;->port:I

    .line 107
    iget v8, p0, Lcom/beyond/io/datagram;->port:I

    if-gez v8, :cond_9

    .line 108
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "bad URI: bad port number "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 108
    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 91
    .restart local v6    # "str":Ljava/lang/String;
    :cond_5
    const-string v8, "w"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 92
    const/4 v8, 0x2

    iput v8, p0, Lcom/beyond/io/datagram;->mode:I

    goto :goto_0

    .line 93
    :cond_6
    const-string v8, "rw"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 94
    const/4 v8, 0x3

    iput v8, p0, Lcom/beyond/io/datagram;->mode:I

    goto :goto_0

    .line 96
    :cond_7
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "bad URI: bad mode"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 101
    .end local v6    # "str":Ljava/lang/String;
    .end local v7    # "timeouts":I
    :cond_8
    const/4 v8, 0x3

    iput v8, p0, Lcom/beyond/io/datagram;->mode:I

    .line 102
    const/4 v7, 0x0

    .restart local v7    # "timeouts":I
    goto :goto_1

    .line 112
    :cond_9
    const/16 v8, 0x3a

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_a

    .line 113
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/beyond/io/datagram;->address:Ljava/lang/String;

    .line 118
    :goto_2
    iget-boolean v8, p0, Lcom/beyond/io/datagram;->wire:Z

    if-nez v8, :cond_c

    .line 122
    :try_start_1
    iget-object v8, p0, Lcom/beyond/io/datagram;->address:Ljava/lang/String;

    if-nez v8, :cond_b

    iget v8, p0, Lcom/beyond/io/datagram;->port:I

    :goto_3
    invoke-direct {p0, v8, v7}, Lcom/beyond/io/datagram;->sockopen(II)I

    move-result v8

    iput v8, p0, Lcom/beyond/io/datagram;->fd:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 129
    :goto_4
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/beyond/io/datagram;->opened:Z

    .line 131
    return-object p0

    .line 115
    :cond_a
    const/4 v8, 0x2

    const/16 v9, 0x3a

    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    invoke-virtual {p1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/beyond/io/datagram;->address:Ljava/lang/String;

    goto :goto_2

    .line 122
    :cond_b
    const/4 v8, 0x0

    goto :goto_3

    .line 123
    :catch_1
    move-exception v1

    .line 124
    .local v1, "ex":Ljava/io/IOException;
    throw v1

    .line 127
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_c
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Lcom/beyond/io/SerialStack;->open(ZLjava/lang/String;S)I

    move-result v8

    iput v8, p0, Lcom/beyond/io/datagram;->fd:I

    goto :goto_4
.end method

.method public declared-synchronized recv(Lorg/kwis/msf/io/Message;)V
    .locals 13
    .param p1, "msg"    # Lorg/kwis/msf/io/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/beyond/io/datagram;->checkOpened()V

    .line 310
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v0

    if-nez v0, :cond_0

    .line 311
    new-instance v0, Ljava/io/IOException;

    const-string v1, "zero length datagram"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 314
    :cond_0
    const/4 v0, 0x4

    :try_start_1
    new-array v4, v0, [B

    .line 315
    .local v4, "peeraddr":[B
    const/4 v0, 0x2

    new-array v5, v0, [B

    .line 319
    .local v5, "peerport":[B
    invoke-static {v4}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v7

    .line 321
    .local v7, "inetaddr":Ljava/net/InetAddress;
    const/4 v0, 0x0

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    .line 322
    const/4 v1, 0x1

    aget-byte v1, v5, v1

    and-int/lit16 v1, v1, 0xff

    .line 321
    or-int v12, v0, v1

    .line 324
    .local v12, "port1":I
    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-direct {v8, v7, v12}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 325
    .local v8, "inets_addr":Ljava/net/InetSocketAddress;
    new-instance v10, Ljava/net/DatagramPacket;

    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v0

    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v1

    invoke-direct {v10, v0, v1, v8}, Ljava/net/DatagramPacket;-><init>([BILjava/net/SocketAddress;)V

    .line 327
    .local v10, "packet":Ljava/net/DatagramPacket;
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->wire:Z

    if-nez v0, :cond_1

    .line 333
    invoke-direct {p0, v10}, Lcom/beyond/io/datagram;->sockrecv(Ljava/net/DatagramPacket;)I

    move-result v6

    .line 341
    .local v6, "cnt":I
    :goto_0
    invoke-virtual {p1, v6}, Lorg/kwis/msf/io/Message;->setLength(I)I

    .line 343
    const/4 v0, 0x0

    aget-byte v0, v4, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    .line 344
    const/4 v1, 0x1

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    .line 343
    or-int/2addr v0, v1

    .line 345
    const/4 v1, 0x2

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    .line 343
    or-int/2addr v0, v1

    .line 346
    const/4 v1, 0x3

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    .line 343
    or-int v9, v0, v1

    .line 348
    .local v9, "ip":I
    const/4 v0, 0x0

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    .line 349
    const/4 v1, 0x1

    aget-byte v1, v5, v1

    and-int/lit16 v1, v1, 0xff

    .line 348
    or-int v11, v0, v1

    .line 350
    .local v11, "port":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 351
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 352
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 353
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    aget-byte v1, v4, v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 354
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 350
    invoke-virtual {p1, v0}, Lorg/kwis/msf/io/Message;->setAddress(Ljava/lang/String;)V

    .line 356
    invoke-virtual {p1, v9}, Lorg/kwis/msf/io/Message;->setAddressInt(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 357
    monitor-exit p0

    return-void

    .line 335
    .end local v6    # "cnt":I
    .end local v9    # "ip":I
    .end local v11    # "port":I
    :cond_1
    :try_start_2
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    .line 336
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v1

    .line 337
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getOffset()I

    move-result v2

    .line 338
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v3

    .line 335
    invoke-static/range {v0 .. v5}, Lcom/beyond/io/SerialStack;->read(I[BII[B[B)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v6

    .restart local v6    # "cnt":I
    goto/16 :goto_0
.end method

.method public declared-synchronized send(Lorg/kwis/msf/io/Message;)V
    .locals 12
    .param p1, "msg"    # Lorg/kwis/msf/io/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 224
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/beyond/io/datagram;->checkOpened()V

    .line 228
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getAddress()Ljava/lang/String;

    move-result-object v6

    .line 230
    .local v6, "addr":Ljava/lang/String;
    const/4 v9, 0x0

    .line 233
    .local v9, "inetaddr":Ljava/net/InetSocketAddress;
    if-nez v6, :cond_3

    .line 234
    iget-object v0, p0, Lcom/beyond/io/datagram;->address:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/beyond/io/datagram;->port:I

    if-gtz v0, :cond_1

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "destination not specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 224
    .end local v6    # "addr":Ljava/lang/String;
    .end local v9    # "inetaddr":Ljava/net/InetSocketAddress;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 237
    .restart local v6    # "addr":Ljava/lang/String;
    .restart local v9    # "inetaddr":Ljava/net/InetSocketAddress;
    :cond_1
    :try_start_1
    iget v5, p0, Lcom/beyond/io/datagram;->port:I

    .line 240
    .local v5, "tport":I
    new-instance v9, Ljava/net/InetSocketAddress;

    .end local v9    # "inetaddr":Ljava/net/InetSocketAddress;
    iget-object v0, p0, Lcom/beyond/io/datagram;->address:Ljava/lang/String;

    iget v1, p0, Lcom/beyond/io/datagram;->port:I

    invoke-direct {v9, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 242
    .restart local v9    # "inetaddr":Ljava/net/InetSocketAddress;
    invoke-virtual {v9}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/beyond/io/datagram;->bytesToInt([BI)I

    move-result v4

    .line 244
    .local v4, "ip":I
    if-ne v4, v2, :cond_2

    .line 245
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad address"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_2
    if-nez v4, :cond_6

    .line 247
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cannot send to local"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 250
    .end local v4    # "ip":I
    .end local v5    # "tport":I
    :cond_3
    const/16 v0, 0x3a

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 251
    .local v8, "idx":I
    if-ne v8, v2, :cond_4

    .line 252
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "no port"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 256
    :cond_4
    add-int/lit8 v0, v8, 0x1

    :try_start_2
    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xa

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v5

    .line 260
    .restart local v5    # "tport":I
    const/4 v0, 0x0

    :try_start_3
    invoke-virtual {v6, v0, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 262
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getAddressInt()I

    move-result v4

    .restart local v4    # "ip":I
    if-ne v4, v2, :cond_6

    .line 264
    new-instance v9, Ljava/net/InetSocketAddress;

    .end local v9    # "inetaddr":Ljava/net/InetSocketAddress;
    invoke-direct {v9, v6, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 265
    .restart local v9    # "inetaddr":Ljava/net/InetSocketAddress;
    invoke-virtual {v9}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/beyond/io/datagram;->bytesToInt([BI)I

    move-result v4

    .line 266
    if-ne v4, v2, :cond_5

    .line 267
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad address"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 257
    .end local v4    # "ip":I
    .end local v5    # "tport":I
    :catch_0
    move-exception v7

    .line 258
    .local v7, "e":Ljava/lang/NumberFormatException;
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad port"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 268
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    .restart local v4    # "ip":I
    .restart local v5    # "tport":I
    :cond_5
    if-nez v4, :cond_6

    .line 269
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cannot send to local"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 281
    .end local v8    # "idx":I
    :cond_6
    :goto_0
    iget-boolean v0, p0, Lcom/beyond/io/datagram;->wire:Z

    if-nez v0, :cond_7

    .line 282
    new-instance v10, Ljava/net/DatagramPacket;

    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v0

    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v1

    invoke-direct {v10, v0, v1, v9}, Ljava/net/DatagramPacket;-><init>([BILjava/net/SocketAddress;)V

    .line 285
    .local v10, "packet":Ljava/net/DatagramPacket;
    invoke-direct {p0, v10}, Lcom/beyond/io/datagram;->socksend(Ljava/net/DatagramPacket;)I

    move-result v11

    .line 294
    .end local v10    # "packet":Ljava/net/DatagramPacket;
    .local v11, "ret":I
    :goto_1
    const/4 v0, -0x2

    if-ne v11, v0, :cond_8

    .line 295
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0

    .line 287
    .end local v11    # "ret":I
    :cond_7
    iget v0, p0, Lcom/beyond/io/datagram;->fd:I

    .line 288
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v1

    .line 289
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getOffset()I

    move-result v2

    .line 290
    invoke-virtual {p1}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v3

    .line 287
    invoke-static/range {v0 .. v5}, Lcom/beyond/io/SerialStack;->write(I[BIIII)I

    move-result v11

    .restart local v11    # "ret":I
    goto :goto_1

    .line 298
    :cond_8
    if-gez v11, :cond_9

    .line 299
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "datagram socket send error"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 302
    :cond_9
    monitor-exit p0

    return-void
.end method
