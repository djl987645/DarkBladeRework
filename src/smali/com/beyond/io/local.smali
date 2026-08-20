.class public Lcom/beyond/io/local;
.super Lcom/beyond/io/SocketModel;
.source "local.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/beyond/io/local$InnerInputStream;,
        Lcom/beyond/io/local$InnerOutputStream;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field private static final DEFAULT_SIZE:I = 0x400


# instance fields
.field private _buf:[B

.field private _bufSize:I

.field private _front:I

.field private _left:I

.field private _rear:I

.field private innerInputStream:Lcom/beyond/io/local$InnerInputStream;

.field private innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

.field private syncObj:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 11
    iput-object v1, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    .line 12
    iput-object v1, p0, Lcom/beyond/io/local;->innerInputStream:Lcom/beyond/io/local$InnerInputStream;

    .line 14
    iput v0, p0, Lcom/beyond/io/local;->_front:I

    .line 15
    iput v0, p0, Lcom/beyond/io/local;->_rear:I

    .line 16
    iput v0, p0, Lcom/beyond/io/local;->_bufSize:I

    .line 17
    iput v0, p0, Lcom/beyond/io/local;->_left:I

    .line 19
    iput-object v1, p0, Lcom/beyond/io/local;->_buf:[B

    .line 21
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/local;->syncObj:Ljava/lang/Object;

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/beyond/io/local;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/beyond/io/local;->syncObj:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1(Lcom/beyond/io/local;)I
    .locals 1

    .prologue
    .line 16
    iget v0, p0, Lcom/beyond/io/local;->_bufSize:I

    return v0
.end method

.method static synthetic access$2(Lcom/beyond/io/local;)I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lcom/beyond/io/local;->_left:I

    return v0
.end method

.method static synthetic access$3(Lcom/beyond/io/local;)I
    .locals 1

    .prologue
    .line 14
    iget v0, p0, Lcom/beyond/io/local;->_front:I

    return v0
.end method

.method static synthetic access$4(Lcom/beyond/io/local;)[B
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/beyond/io/local;->_buf:[B

    return-object v0
.end method

.method static synthetic access$5(Lcom/beyond/io/local;I)V
    .locals 0

    .prologue
    .line 14
    iput p1, p0, Lcom/beyond/io/local;->_front:I

    return-void
.end method

.method static synthetic access$6(Lcom/beyond/io/local;I)V
    .locals 0

    .prologue
    .line 17
    iput p1, p0, Lcom/beyond/io/local;->_left:I

    return-void
.end method

.method static synthetic access$7(Lcom/beyond/io/local;)I
    .locals 1

    .prologue
    .line 15
    iget v0, p0, Lcom/beyond/io/local;->_rear:I

    return v0
.end method

.method static synthetic access$8(Lcom/beyond/io/local;I)V
    .locals 0

    .prologue
    .line 15
    iput p1, p0, Lcom/beyond/io/local;->_rear:I

    return-void
.end method

.method public static debug(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "sMessage"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "className":Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<<local_DBG>> "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  ::::: at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    const/16 v1, 0x400

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/beyond/io/local;->_front:I

    .line 33
    iput v0, p0, Lcom/beyond/io/local;->_rear:I

    .line 34
    iput v1, p0, Lcom/beyond/io/local;->_bufSize:I

    .line 35
    iget v0, p0, Lcom/beyond/io/local;->_bufSize:I

    iput v0, p0, Lcom/beyond/io/local;->_left:I

    .line 36
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/beyond/io/local;->_buf:[B

    .line 37
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    invoke-virtual {v0}, Lcom/beyond/io/local$InnerOutputStream;->close()V

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    if-eqz v0, :cond_1

    .line 62
    iget-object v0, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    invoke-virtual {v0}, Lcom/beyond/io/local$InnerOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    :cond_1
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/beyond/io/local$InnerInputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/local$InnerInputStream;-><init>(Lcom/beyond/io/local;)V

    iput-object v0, p0, Lcom/beyond/io/local;->innerInputStream:Lcom/beyond/io/local$InnerInputStream;

    .line 47
    iget-object v0, p0, Lcom/beyond/io/local;->innerInputStream:Lcom/beyond/io/local$InnerInputStream;

    invoke-virtual {v0}, Lcom/beyond/io/local$InnerInputStream;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/beyond/io/local$InnerOutputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/local$InnerOutputStream;-><init>(Lcom/beyond/io/local;)V

    iput-object v0, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    .line 53
    iget-object v0, p0, Lcom/beyond/io/local;->innerOutputStream:Lcom/beyond/io/local$InnerOutputStream;

    invoke-virtual {v0}, Lcom/beyond/io/local$InnerOutputStream;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 0
    .param p1, "inputUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/beyond/io/local;->init()V

    .line 41
    return-object p0
.end method
