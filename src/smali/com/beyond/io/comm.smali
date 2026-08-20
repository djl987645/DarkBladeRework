.class public Lcom/beyond/io/comm;
.super Lcom/beyond/io/SocketModel;
.source "comm.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;
.implements Lorg/kwis/msf/io/Serial;


# static fields
.field public static final BAUD_115200:I = 0x1c200

.field public static final BAUD_19200:I = 0x4b00

.field public static final BAUD_38400:I = 0x9600

.field public static final BAUD_57600:I = 0xe100

.field public static final COM1:I = 0x0

.field public static final COM2:I = 0x1


# instance fields
.field private baudrate:I

.field private copen:Z

.field private devicetype:I

.field protected fd:I

.field protected isopen:Z

.field opens:I

.field protected osopen:Z

.field protected port:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 24
    iput v0, p0, Lcom/beyond/io/comm;->opens:I

    .line 27
    iput-boolean v0, p0, Lcom/beyond/io/comm;->copen:Z

    .line 30
    iput-boolean v0, p0, Lcom/beyond/io/comm;->isopen:Z

    .line 33
    iput-boolean v0, p0, Lcom/beyond/io/comm;->osopen:Z

    .line 45
    iput v0, p0, Lcom/beyond/io/comm;->devicetype:I

    .line 46
    const v0, 0x1c200

    iput v0, p0, Lcom/beyond/io/comm;->baudrate:I

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/comm;->port:I

    .line 17
    return-void
.end method


# virtual methods
.method protected native SIOAvailable0(I)I
.end method

.method protected native SIOClose0(I)I
.end method

.method protected native SIOOpen0(ILjava/lang/String;)I
.end method

.method protected native SIOReceive0(I[BII)I
.end method

.method protected native SIOTransmit0(I[BII)I
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/beyond/io/comm;->copen:Z

    if-eqz v0, :cond_0

    .line 203
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/comm;->copen:Z

    .line 204
    invoke-virtual {p0}, Lcom/beyond/io/comm;->realClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    :cond_0
    monitor-exit p0

    return-void

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized control(ILjava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p1, "command"    # I
    .param p2, "buf1"    # Ljava/lang/Object;
    .param p3, "buf2"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/beyond/io/comm;->fd:I

    invoke-virtual {p0, v1, p1, p2, p3}, Lcom/beyond/io/comm;->control0(IILjava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 52
    .local v0, "error":I
    if-gez v0, :cond_0

    .line 53
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Serial Device Control Error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .end local v0    # "error":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 55
    .restart local v0    # "error":I
    :cond_0
    monitor-exit p0

    return v0
.end method

.method protected native control0(IILjava/lang/Object;Ljava/lang/Object;)I
.end method

.method ensureOpen()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget-boolean v0, p0, Lcom/beyond/io/comm;->copen:Z

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Ljava/io/IOException;

    const-string v1, "connection closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_0
    return-void
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/comm;->ensureOpen()V

    .line 167
    iget-boolean v1, p0, Lcom/beyond/io/comm;->isopen:Z

    if-eqz v1, :cond_0

    .line 168
    new-instance v1, Ljava/io/IOException;

    const-string v2, "input stream already opened"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 171
    :cond_0
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lcom/beyond/io/comm;->isopen:Z

    .line 173
    new-instance v0, Lcom/beyond/io/InnerSerialInputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/InnerSerialInputStream;-><init>(Lcom/beyond/io/comm;)V

    .line 174
    .local v0, "in":Ljava/io/InputStream;
    iget v1, p0, Lcom/beyond/io/comm;->opens:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/beyond/io/comm;->opens:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 175
    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/comm;->ensureOpen()V

    .line 188
    iget-boolean v1, p0, Lcom/beyond/io/comm;->osopen:Z

    if-eqz v1, :cond_0

    .line 189
    new-instance v1, Ljava/io/IOException;

    const-string v2, "output stream already opened"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 192
    :cond_0
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lcom/beyond/io/comm;->osopen:Z

    .line 194
    new-instance v0, Lcom/beyond/io/InnerSerialOutputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/InnerSerialOutputStream;-><init>(Lcom/beyond/io/comm;)V

    .line 195
    .local v0, "os":Ljava/io/OutputStream;
    iget v1, p0, Lcom/beyond/io/comm;->opens:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/beyond/io/comm;->opens:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 196
    monitor-exit p0

    return-object v0
.end method

.method protected getPortID(I)I
    .locals 1
    .param p1, "portID"    # I

    .prologue
    .line 59
    const-string v0, "comm"

    invoke-virtual {p0, v0, p1}, Lcom/beyond/io/comm;->getPortID0(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method protected native getPortID0(Ljava/lang/String;I)I
.end method

.method public open(Ljava/lang/String;IZ)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .param p3, "timeouts"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Should not be called"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2f

    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 78
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v6, :cond_1

    .line 79
    :cond_0
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "bad URL: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 82
    :cond_1
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 84
    const/16 v3, 0x3a

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 85
    .local v1, "comma":I
    if-ge v1, v5, :cond_2

    .line 86
    new-instance v3, Ljava/io/IOException;

    const-string v4, "no \':\' in URL"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 88
    :cond_2
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "Port":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/beyond/io/comm;->port:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 134
    iget v3, p0, Lcom/beyond/io/comm;->port:I

    invoke-virtual {p0, v3}, Lcom/beyond/io/comm;->getPortID(I)I

    move-result v3

    iput v3, p0, Lcom/beyond/io/comm;->port:I

    .line 135
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    .line 136
    iget v3, p0, Lcom/beyond/io/comm;->port:I

    const-string v4, "baudrate=115200"

    invoke-virtual {p0, v3, v4}, Lcom/beyond/io/comm;->SIOOpen0(ILjava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/beyond/io/comm;->fd:I

    .line 139
    :goto_0
    iget v3, p0, Lcom/beyond/io/comm;->fd:I

    if-gez v3, :cond_4

    .line 140
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Serial Device Open Error"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 98
    :catch_0
    move-exception v2

    .line 99
    .local v2, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Invalid Number format"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 138
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :cond_3
    iget v3, p0, Lcom/beyond/io/comm;->port:I

    invoke-virtual {p0, v3, p1}, Lcom/beyond/io/comm;->SIOOpen0(ILjava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/beyond/io/comm;->fd:I

    goto :goto_0

    .line 142
    :cond_4
    iget v3, p0, Lcom/beyond/io/comm;->opens:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/beyond/io/comm;->opens:I

    .line 143
    iput-boolean v5, p0, Lcom/beyond/io/comm;->copen:Z

    .line 145
    return-object p0
.end method

.method declared-synchronized realClose()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/beyond/io/comm;->opens:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/beyond/io/comm;->opens:I

    if-nez v1, :cond_0

    .line 211
    iget v1, p0, Lcom/beyond/io/comm;->fd:I

    invoke-virtual {p0, v1}, Lcom/beyond/io/comm;->SIOClose0(I)I

    move-result v0

    .line 212
    .local v0, "error":I
    if-gez v0, :cond_0

    .line 213
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Serial Device Close Error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    .end local v0    # "error":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 216
    :cond_0
    monitor-exit p0

    return-void
.end method
