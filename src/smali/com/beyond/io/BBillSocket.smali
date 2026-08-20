.class public Lcom/beyond/io/BBillSocket;
.super Lcom/beyond/io/SocketModel;
.source "BBillSocket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/beyond/io/BBillSocket$InnerInputStream;,
        Lcom/beyond/io/BBillSocket$InnerOutputStream;
    }
.end annotation


# static fields
.field static final CheckLeftBytes:Z

.field static final KAFBILL:Z


# instance fields
.field private billHeader:Lcom/beyond/io/BillHeader;

.field private innerInputStream:Lcom/beyond/io/BBillSocket$InnerInputStream;

.field private innerOutputStream:Lcom/beyond/io/BBillSocket$InnerOutputStream;

.field private socket:Lorg/kwis/msf/io/Socket;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 22
    return-void
.end method

.method static synthetic access$0(Lcom/beyond/io/BBillSocket;)Lorg/kwis/msf/io/Socket;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/beyond/io/BBillSocket;->socket:Lorg/kwis/msf/io/Socket;

    return-object v0
.end method

.method static synthetic access$1(Lcom/beyond/io/BBillSocket;Lorg/kwis/msf/io/Socket;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/beyond/io/BBillSocket;->socket:Lorg/kwis/msf/io/Socket;

    return-void
.end method

.method static synthetic access$2(Lcom/beyond/io/BBillSocket;)Lcom/beyond/io/BillHeader;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/beyond/io/BBillSocket;->billHeader:Lcom/beyond/io/BillHeader;

    return-object v0
.end method

.method private getHostbyName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    :try_start_0
    invoke-static {p1}, Lcom/beyond/io/host;->getHostIP(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 79
    .local v2, "ipnumber":I
    new-instance v0, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    and-int/lit16 v4, v2, 0xff

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    shr-int/lit8 v4, v2, 0x8

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 80
    shr-int/lit8 v4, v2, 0x10

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    shr-int/lit8 v4, v2, 0x18

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 79
    invoke-direct {v0, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 82
    .local v0, "addr":Ljava/lang/String;
    return-object v0

    .line 76
    .end local v0    # "addr":Ljava/lang/String;
    .end local v2    # "ipnumber":I
    :catch_0
    move-exception v1

    .line 77
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getHostbyName() - cannot connect to "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
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
    .line 62
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/BBillSocket;->socket:Lorg/kwis/msf/io/Socket;

    invoke-interface {v0}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    monitor-exit p0

    return-void

    .line 62
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
    .line 49
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/beyond/io/BBillSocket$InnerInputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/BBillSocket$InnerInputStream;-><init>(Lcom/beyond/io/BBillSocket;)V

    iput-object v0, p0, Lcom/beyond/io/BBillSocket;->innerInputStream:Lcom/beyond/io/BBillSocket$InnerInputStream;

    .line 51
    iget-object v0, p0, Lcom/beyond/io/BBillSocket;->innerInputStream:Lcom/beyond/io/BBillSocket$InnerInputStream;

    invoke-virtual {v0}, Lcom/beyond/io/BBillSocket$InnerInputStream;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 49
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
    .line 55
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/beyond/io/BBillSocket$InnerOutputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/BBillSocket$InnerOutputStream;-><init>(Lcom/beyond/io/BBillSocket;)V

    iput-object v0, p0, Lcom/beyond/io/BBillSocket;->innerOutputStream:Lcom/beyond/io/BBillSocket$InnerOutputStream;

    .line 57
    iget-object v0, p0, Lcom/beyond/io/BBillSocket;->innerOutputStream:Lcom/beyond/io/BBillSocket$InnerOutputStream;

    invoke-virtual {v0}, Lcom/beyond/io/BBillSocket$InnerOutputStream;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 3
    .param p1, "inputUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "socket:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/beyond/io/ConnectionFactory;->findScheme(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/io/BBillSocket;->socket:Lorg/kwis/msf/io/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    new-instance v1, Lcom/beyond/io/BillHeader;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/beyond/io/BillHeader;-><init>(Z)V

    iput-object v1, p0, Lcom/beyond/io/BBillSocket;->billHeader:Lcom/beyond/io/BillHeader;

    .line 45
    return-object p0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/beyond/io/BBillSocket;->socket:Lorg/kwis/msf/io/Socket;

    .line 31
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
