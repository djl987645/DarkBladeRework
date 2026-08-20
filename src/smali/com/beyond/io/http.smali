.class public Lcom/beyond/io/http;
.super Lcom/beyond/io/SocketModel;
.source "http.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;
.implements Lorg/kwis/msf/io/HttpSocket;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/beyond/io/http$BufferedInputStream;,
        Lcom/beyond/io/http$FilterInputStream;,
        Lcom/beyond/io/http$HttpConnectionManager;,
        Lcom/beyond/io/http$InnerInputStream;,
        Lcom/beyond/io/http$InnerOutputStream;
    }
.end annotation


# static fields
.field public static connectionPool:Lcom/beyond/io/http$HttpConnectionManager;


# instance fields
.field private _iis:Lcom/beyond/io/http$InnerInputStream;

.field private _ios:Lcom/beyond/io/http$InnerOutputStream;

.field private _isOpened:Z

.field private _osOpened:Z

.field private _url_idx:I

.field private chunkedIn:Z

.field private chunkleft:I

.field private chunksize:I

.field private closeConnection:Z

.field private connected:Z

.field private curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

.field private error:Ljava/io/DataInputStream;

.field private file:Ljava/lang/String;

.field private headerFields:Ljava/util/Hashtable;

.field private headerIndex:Ljava/util/Vector;

.field private host:Ljava/lang/String;

.field private httpVersion:Ljava/lang/String;

.field private input:Lcom/beyond/io/http$BufferedInputStream;

.field private method:Ljava/lang/String;

.field private opened:Z

.field private opens:I

.field private output:Ljava/io/DataOutputStream;

.field private port:I

.field private poster:Lcom/beyond/io/http$InnerOutputStream;

.field private protocol:Ljava/lang/String;

.field private proxyHost:Ljava/lang/String;

.field private proxyPort:I

.field private query:Ljava/lang/String;

.field private ref:Ljava/lang/String;

.field private reqProperties:Ljava/util/Hashtable;

.field private responseCode:I

.field private responseMsg:Ljava/lang/String;

.field private timeout:I

.field private url:Ljava/lang/String;

.field whileInRead:Z

.field private wire:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/16 v2, 0x50

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 599
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 549
    iput-object v0, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    .line 550
    iput v2, p0, Lcom/beyond/io/http;->proxyPort:I

    .line 561
    iput v2, p0, Lcom/beyond/io/http;->port:I

    .line 577
    iput-object v0, p0, Lcom/beyond/io/http;->_iis:Lcom/beyond/io/http$InnerInputStream;

    .line 578
    iput-object v0, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    .line 579
    iput-boolean v1, p0, Lcom/beyond/io/http;->_isOpened:Z

    .line 580
    iput-boolean v1, p0, Lcom/beyond/io/http;->_osOpened:Z

    .line 581
    iput-boolean v1, p0, Lcom/beyond/io/http;->opened:Z

    .line 583
    iput-boolean v1, p0, Lcom/beyond/io/http;->chunkedIn:Z

    .line 587
    iput-boolean v1, p0, Lcom/beyond/io/http;->closeConnection:Z

    .line 590
    iput-boolean v1, p0, Lcom/beyond/io/http;->wire:Z

    .line 592
    iput-boolean v1, p0, Lcom/beyond/io/http;->whileInRead:Z

    .line 593
    const/16 v0, 0x2710

    iput v0, p0, Lcom/beyond/io/http;->timeout:I

    .line 600
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/http;->reqProperties:Ljava/util/Hashtable;

    .line 601
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/http;->headerFields:Ljava/util/Hashtable;

    .line 602
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/http;->headerIndex:Ljava/util/Vector;

    .line 603
    iput v1, p0, Lcom/beyond/io/http;->opens:I

    .line 604
    iput-boolean v1, p0, Lcom/beyond/io/http;->connected:Z

    .line 605
    const-string v0, "GET"

    iput-object v0, p0, Lcom/beyond/io/http;->method:Ljava/lang/String;

    .line 606
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/http;->responseCode:I

    .line 607
    const-string v0, "http"

    iput-object v0, p0, Lcom/beyond/io/http;->protocol:Ljava/lang/String;

    .line 608
    return-void
.end method

.method static synthetic access$0(Lcom/beyond/io/http;)Z
    .locals 1

    .prologue
    .line 583
    iget-boolean v0, p0, Lcom/beyond/io/http;->chunkedIn:Z

    return v0
.end method

.method static synthetic access$1(Lcom/beyond/io/http;)I
    .locals 1

    .prologue
    .line 585
    iget v0, p0, Lcom/beyond/io/http;->chunkleft:I

    return v0
.end method

.method static synthetic access$2(Lcom/beyond/io/http;Ljava/io/InputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 707
    invoke-direct {p0, p1}, Lcom/beyond/io/http;->readCRLF(Ljava/io/InputStream;)V

    return-void
.end method

.method static synthetic access$3(Lcom/beyond/io/http;Ljava/io/InputStream;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 719
    invoke-direct {p0, p1}, Lcom/beyond/io/http;->readChunkSize(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method static synthetic access$4(Lcom/beyond/io/http;I)V
    .locals 0

    .prologue
    .line 584
    iput p1, p0, Lcom/beyond/io/http;->chunksize:I

    return-void
.end method

.method static synthetic access$5(Lcom/beyond/io/http;)I
    .locals 1

    .prologue
    .line 584
    iget v0, p0, Lcom/beyond/io/http;->chunksize:I

    return v0
.end method

.method static synthetic access$6(Lcom/beyond/io/http;I)V
    .locals 0

    .prologue
    .line 585
    iput p1, p0, Lcom/beyond/io/http;->chunkleft:I

    return-void
.end method

.method static synthetic access$7(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 610
    invoke-static {p0}, Lcom/beyond/io/http;->findSchemeSecure(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v0

    return-object v0
.end method

.method private native checkNetwork0()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method private doFirstWrite()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 978
    iget-object v4, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    if-nez v4, :cond_2

    .line 979
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/beyond/io/http;->method:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/beyond/io/http;->getFile()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 980
    iget-object v4, p0, Lcom/beyond/io/http;->query:Ljava/lang/String;

    const-string v6, ""

    if-ne v4, v6, :cond_1

    const-string v4, ""

    :goto_0
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 981
    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "HTTP/1.1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 979
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 991
    .local v2, "reqLine":Ljava/lang/String;
    :goto_1
    iget-object v4, p0, Lcom/beyond/io/http;->reqProperties:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 992
    .local v1, "reqKeys":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_4

    .line 1001
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1002
    iget-object v4, p0, Lcom/beyond/io/http;->output:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/DataOutputStream;->write([B)V

    .line 1003
    iget-object v4, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    if-eqz v4, :cond_0

    .line 1004
    iget-object v4, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    invoke-virtual {v4}, Lcom/beyond/io/http$InnerOutputStream;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 1005
    iget-object v4, p0, Lcom/beyond/io/http;->output:Ljava/io/DataOutputStream;

    iget-object v5, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    invoke-virtual {v5}, Lcom/beyond/io/http$InnerOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/DataOutputStream;->write([B)V

    .line 1009
    :cond_0
    iget-object v4, p0, Lcom/beyond/io/http;->output:Ljava/io/DataOutputStream;

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    .line 1011
    return-void

    .line 980
    .end local v1    # "reqKeys":Ljava/util/Enumeration;
    .end local v2    # "reqLine":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "?"

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/beyond/io/http;->query:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 983
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/beyond/io/http;->method:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 984
    iget-object v5, p0, Lcom/beyond/io/http;->protocol:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/beyond/io/http;->port:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 985
    invoke-virtual {p0}, Lcom/beyond/io/http;->getFile()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 986
    iget-object v4, p0, Lcom/beyond/io/http;->query:Ljava/lang/String;

    const-string v6, ""

    if-ne v4, v6, :cond_3

    const-string v4, ""

    :goto_3
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 987
    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "HTTP/1.1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 983
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "reqLine":Ljava/lang/String;
    goto/16 :goto_1

    .line 986
    .end local v2    # "reqLine":Ljava/lang/String;
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "?"

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/beyond/io/http;->query:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 993
    .restart local v1    # "reqKeys":Ljava/util/Enumeration;
    .restart local v2    # "reqLine":Ljava/lang/String;
    :cond_4
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 994
    .local v0, "key":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/beyond/io/http;->reqProperties:Ljava/util/Hashtable;

    invoke-virtual {v5, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 997
    .local v3, "reqPropLine":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2
.end method

.method private static findSchemeSecure(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 611
    invoke-static {p0}, Lcom/beyond/io/ConnectionFactory;->findScheme(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v0

    return-object v0
.end method

.method private parseFile()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1257
    const-string v2, "/"

    .line 1258
    .local v2, "token":Ljava/lang/String;
    iget-object v4, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    iget v5, p0, Lcom/beyond/io/http;->_url_idx:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1259
    .local v0, "buf":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    move-object v3, v2

    .line 1268
    .end local v2    # "token":Ljava/lang/String;
    .local v3, "token":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 1260
    .end local v3    # "token":Ljava/lang/String;
    .restart local v2    # "token":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1261
    new-instance v4, Ljava/io/IOException;

    const-string v5, "invalid path"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1263
    :cond_1
    const/16 v4, 0x3f

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1264
    .local v1, "n":I
    if-gez v1, :cond_2

    const/16 v4, 0x23

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1265
    :cond_2
    if-gez v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1266
    :cond_3
    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1267
    iget v4, p0, Lcom/beyond/io/http;->_url_idx:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/beyond/io/http;->_url_idx:I

    move-object v3, v2

    .line 1268
    .end local v2    # "token":Ljava/lang/String;
    .restart local v3    # "token":Ljava/lang/String;
    goto :goto_0
.end method

.method private parseHostname()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1219
    iget-object v3, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    iget v4, p0, Lcom/beyond/io/http;->_url_idx:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1220
    .local v0, "buf":Ljava/lang/String;
    const-string v3, "//"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1221
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1222
    iget v3, p0, Lcom/beyond/io/http;->_url_idx:I

    add-int/lit8 v3, v3, 0x2

    iput v3, p0, Lcom/beyond/io/http;->_url_idx:I

    .line 1224
    :cond_0
    const/16 v3, 0x3a

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1225
    .local v1, "n":I
    if-gez v1, :cond_1

    const/16 v3, 0x2f

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1226
    :cond_1
    if-gez v1, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1227
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1228
    .local v2, "token":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    .line 1229
    new-instance v3, Ljava/io/IOException;

    const-string v4, "host name cannot be empty"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1231
    :cond_3
    iget v3, p0, Lcom/beyond/io/http;->_url_idx:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/beyond/io/http;->_url_idx:I

    .line 1232
    return-object v2
.end method

.method private parsePort()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1236
    const/16 v3, 0x50

    .line 1237
    .local v3, "p":I
    iget-object v5, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    iget v6, p0, Lcom/beyond/io/http;->_url_idx:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1238
    .local v0, "buf":Ljava/lang/String;
    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    move v4, v3

    .line 1252
    .end local v3    # "p":I
    .local v4, "p":I
    :goto_0
    return v4

    .line 1239
    .end local v4    # "p":I
    .restart local v3    # "p":I
    :cond_0
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1240
    iget v5, p0, Lcom/beyond/io/http;->_url_idx:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/beyond/io/http;->_url_idx:I

    .line 1241
    const/16 v5, 0x2f

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1242
    .local v1, "n":I
    if-gez v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1244
    :cond_1
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1245
    if-gtz v3, :cond_2

    .line 1246
    new-instance v5, Ljava/lang/NumberFormatException;

    invoke-direct {v5}, Ljava/lang/NumberFormatException;-><init>()V

    throw v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1248
    :catch_0
    move-exception v2

    .line 1249
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "invalid port"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1251
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_2
    iget v5, p0, Lcom/beyond/io/http;->_url_idx:I

    add-int/2addr v5, v1

    iput v5, p0, Lcom/beyond/io/http;->_url_idx:I

    move v4, v3

    .line 1252
    .end local v3    # "p":I
    .restart local v4    # "p":I
    goto :goto_0
.end method

.method private parseQuery()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x23

    .line 1272
    iget-object v2, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    iget v3, p0, Lcom/beyond/io/http;->_url_idx:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1273
    .local v0, "buf":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_1

    :cond_0
    const-string v2, ""

    .line 1280
    :goto_0
    return-object v2

    .line 1274
    :cond_1
    const-string v2, "?"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1275
    new-instance v2, Ljava/io/IOException;

    const-string v3, "invalid ref"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1277
    :cond_2
    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1278
    .local v1, "n":I
    if-gez v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1279
    :cond_3
    iget v2, p0, Lcom/beyond/io/http;->_url_idx:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/beyond/io/http;->_url_idx:I

    .line 1280
    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private parseRef()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1284
    iget-object v1, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    iget v2, p0, Lcom/beyond/io/http;->_url_idx:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1285
    .local v0, "buf":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ""

    .line 1289
    :goto_0
    return-object v1

    .line 1286
    :cond_0
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1287
    new-instance v1, Ljava/io/IOException;

    const-string v2, "invalid query"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1289
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private readCRLF(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 709
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 711
    .local v0, "ch":I
    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    .line 712
    new-instance v1, Ljava/io/IOException;

    const-string v2, "missing CRLF"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 713
    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 715
    const/16 v1, 0xa

    if-eq v0, v1, :cond_1

    .line 716
    new-instance v1, Ljava/io/IOException;

    const-string v2, "missing CRLF"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 717
    :cond_1
    return-void
.end method

.method private readChunkSize(Ljava/io/InputStream;)I
    .locals 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 721
    const/4 v4, -0x1

    .line 723
    .local v4, "size":I
    const/4 v1, 0x0

    .line 725
    .local v1, "chunk":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, p1}, Lcom/beyond/io/http;->readLine(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 729
    :goto_0
    if-nez v1, :cond_0

    .line 730
    :try_start_1
    new-instance v5, Ljava/io/IOException;

    const-string v6, "No Chunk Size"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 740
    :catch_0
    move-exception v2

    .line 741
    .local v2, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "invalid chunk size number format"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 733
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :cond_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v3, v5, :cond_2

    .line 739
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    .line 745
    return v4

    .line 734
    :cond_2
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 735
    .local v0, "ch":C
    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Character;->digit(CI)I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 733
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 726
    .end local v0    # "ch":C
    .end local v3    # "i":I
    :catch_1
    move-exception v5

    goto :goto_0
.end method

.method private readHeaders(Ljava/io/InputStream;)V
    .locals 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1145
    :goto_0
    invoke-direct {p0, p1}, Lcom/beyond/io/http;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 1146
    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    return-void

    .line 1148
    :cond_1
    const/16 v4, 0x3a

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 1149
    .local v0, "index":I
    if-gez v0, :cond_2

    new-instance v4, Ljava/io/IOException;

    const-string v5, "malformed header field"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1151
    :cond_2
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1152
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Ljava/io/IOException;

    const-string v5, "malformed header field"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1154
    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v5, v0, 0x1

    if-gt v4, v5, :cond_4

    const-string v3, ""

    .line 1157
    .local v3, "value":Ljava/lang/String;
    :goto_1
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "DEBUG:HEADER = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1158
    iget-object v4, p0, Lcom/beyond/io/http;->headerFields:Ljava/util/Hashtable;

    invoke-direct {p0, v1}, Lcom/beyond/io/http;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1159
    iget-object v4, p0, Lcom/beyond/io/http;->headerIndex:Ljava/util/Vector;

    invoke-direct {p0, v1}, Lcom/beyond/io/http;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 1155
    .end local v3    # "value":Ljava/lang/String;
    :cond_4
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/String;
    goto :goto_1
.end method

.method private readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1164
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1169
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1170
    .local v1, "c":I
    if-gez v1, :cond_1

    .line 1183
    .end local v1    # "c":I
    :goto_1
    return-object v3

    .line 1173
    .restart local v1    # "c":I
    :cond_1
    const/16 v4, 0xd

    if-eq v1, v4, :cond_0

    .line 1178
    const/16 v4, 0xa

    if-ne v1, v4, :cond_2

    .line 1183
    new-instance v3, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    invoke-direct {v3, v4, v5, v6}, Ljava/lang/String;-><init>([BII)V

    goto :goto_1

    .line 1174
    .end local v1    # "c":I
    :catch_0
    move-exception v2

    .line 1175
    .local v2, "ioe":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 1179
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v1    # "c":I
    :cond_2
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0
.end method

.method private readResponseMessage(Ljava/io/InputStream;)V
    .locals 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x20

    .line 1102
    invoke-direct {p0, p1}, Lcom/beyond/io/http;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 1104
    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    .line 1105
    invoke-direct {p0, p1}, Lcom/beyond/io/http;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 1111
    :cond_0
    const/4 v4, -0x1

    iput v4, p0, Lcom/beyond/io/http;->responseCode:I

    .line 1112
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/beyond/io/http;->responseMsg:Ljava/lang/String;

    .line 1115
    if-nez v2, :cond_2

    .line 1137
    :cond_1
    :goto_0
    new-instance v4, Ljava/io/IOException;

    const-string v5, "malformed response message"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1116
    :cond_2
    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 1117
    .local v1, "httpEnd":I
    if-ltz v1, :cond_1

    .line 1119
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/io/http;->httpVersion:Ljava/lang/String;

    .line 1120
    iget-object v4, p0, Lcom/beyond/io/http;->httpVersion:Ljava/lang/String;

    const-string v5, "HTTP"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1121
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v1, :cond_1

    .line 1123
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 1124
    .local v0, "codeEnd":I
    if-ltz v0, :cond_1

    .line 1125
    add-int/lit8 v4, v1, 0x1

    add-int/2addr v0, v4

    .line 1126
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v0, :cond_1

    .line 1128
    add-int/lit8 v4, v1, 0x1

    :try_start_0
    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/beyond/io/http;->responseCode:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1131
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/io/http;->responseMsg:Ljava/lang/String;

    .line 1134
    return-void

    .line 1129
    :catch_0
    move-exception v3

    .local v3, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static declared-synchronized removeAllconnections(I)V
    .locals 2
    .param p0, "id"    # I

    .prologue
    .line 1316
    const-class v1, Lcom/beyond/io/http;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 1318
    :try_start_1
    sget-object v0, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    invoke-virtual {v0, p0}, Lcom/beyond/io/http$HttpConnectionManager;->close(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1321
    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    .line 1316
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 1319
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private toLowerCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 1302
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 1304
    .local v1, "low":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 1308
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1305
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1304
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected checkOpened()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 674
    iget-boolean v0, p0, Lcom/beyond/io/http;->opened:Z

    if-nez v0, :cond_0

    .line 675
    new-instance v0, Ljava/io/IOException;

    const-string v1, "already closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 676
    :cond_0
    return-void
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 656
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/beyond/io/http;->opened:Z

    if-eqz v0, :cond_0

    .line 657
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/http;->opened:Z

    .line 658
    invoke-virtual {p0}, Lcom/beyond/io/http;->realClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 660
    :cond_0
    monitor-exit p0

    return-void

    .line 656
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized connect()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1014
    monitor-enter p0

    :try_start_0
    iget-boolean v4, p0, Lcom/beyond/io/http;->connected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_1

    .line 1097
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1018
    :cond_1
    :try_start_1
    sget-object v4, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    if-nez v4, :cond_3

    .line 1019
    const/4 v2, 0x0

    .line 1023
    .local v2, "num":I
    const/16 v2, 0xa

    .line 1025
    if-gtz v2, :cond_2

    const/4 v2, 0x1

    .line 1026
    :cond_2
    new-instance v4, Lcom/beyond/io/http$HttpConnectionManager;

    invoke-direct {v4, p0, v2}, Lcom/beyond/io/http$HttpConnectionManager;-><init>(Lcom/beyond/io/http;I)V

    sput-object v4, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1031
    .end local v2    # "num":I
    :cond_3
    const/16 v4, 0xbb8

    :try_start_2
    iput v4, p0, Lcom/beyond/io/http;->timeout:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1034
    :goto_1
    :try_start_3
    iget-object v4, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    if-nez v4, :cond_a

    .line 1035
    sget-object v5, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    iget-object v6, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    iget v7, p0, Lcom/beyond/io/http;->port:I

    .line 1036
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ":"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v8, p0, Lcom/beyond/io/http;->port:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, "/rw/"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v8, p0, Lcom/beyond/io/http;->timeout:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v4, p0, Lcom/beyond/io/http;->wire:Z

    if-eqz v4, :cond_9

    const-string v4, ":wire"

    :goto_2
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1035
    invoke-virtual {v5, v6, v7, v4}, Lcom/beyond/io/http$HttpConnectionManager;->getConnection(Ljava/lang/String;ILjava/lang/String;)Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 1041
    :goto_3
    iget-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v4, v4, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    iput-object v4, p0, Lcom/beyond/io/http;->output:Ljava/io/DataOutputStream;

    .line 1042
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1048
    :try_start_4
    const-string v4, "Content-Length"

    invoke-virtual {p0, v4}, Lcom/beyond/io/http;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4

    .line 1049
    const-string v5, "Content-Length"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    if-nez v4, :cond_c

    const/4 v4, 0x0

    :goto_4
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v5, v4}, Lcom/beyond/io/http;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1053
    :cond_4
    :try_start_5
    invoke-direct {p0}, Lcom/beyond/io/http;->doFirstWrite()V

    .line 1055
    iget-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v4, v4, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    iput-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    .line 1056
    iget-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    invoke-direct {p0, v4}, Lcom/beyond/io/http;->readResponseMessage(Ljava/io/InputStream;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1070
    :goto_5
    :try_start_6
    iget-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    invoke-direct {p0, v4}, Lcom/beyond/io/http;->readHeaders(Ljava/io/InputStream;)V

    .line 1072
    iget v4, p0, Lcom/beyond/io/http;->responseCode:I

    const/16 v5, 0xc8

    if-lt v4, v5, :cond_5

    .line 1078
    :cond_5
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/beyond/io/http;->connected:Z

    .line 1081
    const-string v4, "connection"

    invoke-virtual {p0, v4}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1082
    .local v0, "con":Ljava/lang/String;
    if-eqz v0, :cond_6

    const-string v4, "close"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 1083
    :cond_6
    iget-object v4, p0, Lcom/beyond/io/http;->httpVersion:Ljava/lang/String;

    if-eqz v4, :cond_8

    iget-object v4, p0, Lcom/beyond/io/http;->httpVersion:Ljava/lang/String;

    const-string v5, "HTTP/1.0"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1085
    :cond_7
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/beyond/io/http;->closeConnection:Z

    .line 1090
    :cond_8
    const-string v4, "transfer-encoding"

    invoke-virtual {p0, v4}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1091
    .local v3, "te":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v4, "chunked"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1092
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/beyond/io/http;->chunkedIn:Z

    .line 1093
    iget-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    invoke-direct {p0, v4}, Lcom/beyond/io/http;->readChunkSize(Ljava/io/InputStream;)I

    move-result v4

    iput v4, p0, Lcom/beyond/io/http;->chunksize:I

    .line 1094
    iget v4, p0, Lcom/beyond/io/http;->chunksize:I

    iput v4, p0, Lcom/beyond/io/http;->chunkleft:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 1014
    .end local v0    # "con":Ljava/lang/String;
    .end local v3    # "te":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1036
    :cond_9
    :try_start_7
    const-string v4, ""

    goto/16 :goto_2

    .line 1038
    :cond_a
    sget-object v5, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    iget-object v6, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    iget v7, p0, Lcom/beyond/io/http;->port:I

    .line 1039
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ":"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v8, p0, Lcom/beyond/io/http;->proxyPort:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, "/rw/"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v8, p0, Lcom/beyond/io/http;->timeout:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v4, p0, Lcom/beyond/io/http;->wire:Z

    if-eqz v4, :cond_b

    const-string v4, ":wire"

    :goto_6
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1038
    invoke-virtual {v5, v6, v7, v4}, Lcom/beyond/io/http$HttpConnectionManager;->getConnection(Ljava/lang/String;ILjava/lang/String;)Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_3

    .line 1043
    :catch_0
    move-exception v1

    .line 1044
    .local v1, "e":Ljava/io/IOException;
    :try_start_8
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "get socket connection failed"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1045
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1039
    .end local v1    # "e":Ljava/io/IOException;
    :cond_b
    :try_start_9
    const-string v4, ""
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_6

    .line 1049
    :cond_c
    :try_start_a
    iget-object v4, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    invoke-virtual {v4}, Lcom/beyond/io/http$InnerOutputStream;->size()I

    move-result v4

    goto/16 :goto_4

    .line 1057
    :catch_1
    move-exception v1

    .line 1059
    .restart local v1    # "e":Ljava/io/IOException;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/beyond/io/http;->output:Ljava/io/DataOutputStream;

    .line 1060
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    .line 1061
    sget-object v4, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    iget-object v5, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    invoke-virtual {v4, v5}, Lcom/beyond/io/http$HttpConnectionManager;->reConnect(Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;)Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 1062
    iget-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v4, v4, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    iput-object v4, p0, Lcom/beyond/io/http;->output:Ljava/io/DataOutputStream;

    .line 1064
    invoke-direct {p0}, Lcom/beyond/io/http;->doFirstWrite()V

    .line 1066
    iget-object v4, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v4, v4, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    iput-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    .line 1067
    iget-object v4, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    invoke-direct {p0, v4}, Lcom/beyond/io/http;->readResponseMessage(Ljava/io/InputStream;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_5

    .line 1032
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v4

    goto/16 :goto_1
.end method

.method protected disconnect()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1187
    iget-object v0, p0, Lcom/beyond/io/http;->_iis:Lcom/beyond/io/http$InnerInputStream;

    if-eqz v0, :cond_1

    .line 1188
    iget-object v1, p0, Lcom/beyond/io/http;->_iis:Lcom/beyond/io/http$InnerInputStream;

    monitor-enter v1

    .line 1190
    :try_start_0
    iget-boolean v0, p0, Lcom/beyond/io/http;->whileInRead:Z

    if-eqz v0, :cond_0

    .line 1192
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/http;->closeConnection:Z

    .line 1188
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1197
    :cond_1
    iget-boolean v0, p0, Lcom/beyond/io/http;->closeConnection:Z

    if-eqz v0, :cond_5

    .line 1199
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v0, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    if-eqz v0, :cond_2

    .line 1200
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v0, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v0}, Lorg/kwis/msf/io/Socket;->close()V

    .line 1201
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iput-object v2, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 1203
    :cond_2
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v0, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    if-eqz v0, :cond_3

    .line 1204
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v0, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    invoke-virtual {v0}, Lcom/beyond/io/http$BufferedInputStream;->close()V

    .line 1205
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iput-object v2, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    .line 1207
    :cond_3
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v0, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    if-eqz v0, :cond_4

    .line 1208
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iget-object v0, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 1209
    iget-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    iput-object v2, v0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 1211
    :cond_4
    iput-boolean v3, p0, Lcom/beyond/io/http;->closeConnection:Z

    .line 1214
    :cond_5
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/http;->responseCode:I

    .line 1215
    iput-object v2, p0, Lcom/beyond/io/http;->responseMsg:Ljava/lang/String;

    .line 1216
    iput-boolean v3, p0, Lcom/beyond/io/http;->connected:Z

    .line 1217
    return-void

    .line 1188
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getDate()J
    .locals 3

    .prologue
    .line 855
    const-string v0, "date"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/beyond/io/http;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 2

    .prologue
    .line 845
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 847
    const-string v1, "content-encoding"

    invoke-virtual {p0, v1}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    .line 846
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getExpiration()J
    .locals 3

    .prologue
    .line 851
    const-string v0, "expires"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/beyond/io/http;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 768
    iget-object v0, p0, Lcom/beyond/io/http;->file:Ljava/lang/String;

    return-object v0
.end method

.method public getHeaderField(I)Ljava/lang/String;
    .locals 3
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x0

    .line 869
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 871
    iget-object v2, p0, Lcom/beyond/io/http;->headerIndex:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    .line 876
    :goto_0
    return-object v1

    .line 870
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    goto :goto_0

    .line 876
    .end local v0    # "x":Ljava/io/IOException;
    :cond_0
    iget-object v2, p0, Lcom/beyond/io/http;->headerFields:Ljava/util/Hashtable;

    iget-object v1, p0, Lcom/beyond/io/http;->headerIndex:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 863
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 865
    iget-object v1, p0, Lcom/beyond/io/http;->headerFields:Ljava/util/Hashtable;

    invoke-direct {p0, p1}, Lcom/beyond/io/http;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_0
    return-object v1

    .line 864
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getHeaderFieldDate(Ljava/lang/String;J)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # J

    .prologue
    .line 905
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 909
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/beyond/io/DateFormat;->getMillisToGMT(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide p2

    .line 912
    .end local p2    # "def":J
    :goto_0
    return-wide p2

    .line 906
    .restart local p2    # "def":J
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    goto :goto_0

    .line 910
    .end local v0    # "x":Ljava/io/IOException;
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public getHeaderFieldInt(Ljava/lang/String;I)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # I

    .prologue
    .line 890
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 894
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 895
    .local v0, "intStr":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 896
    const/4 p2, 0x0

    .line 901
    .end local v0    # "intStr":Ljava/lang/String;
    .end local p2    # "def":I
    :goto_0
    return p2

    .line 891
    .restart local p2    # "def":I
    :catch_0
    move-exception v1

    .local v1, "x":Ljava/io/IOException;
    goto :goto_0

    .line 898
    .end local v1    # "x":Ljava/io/IOException;
    .restart local v0    # "intStr":Ljava/lang/String;
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result p2

    goto :goto_0

    .line 899
    .end local v0    # "intStr":Ljava/lang/String;
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public getHeaderFieldKey(I)Ljava/lang/String;
    .locals 3
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x0

    .line 880
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 882
    iget-object v2, p0, Lcom/beyond/io/http;->headerIndex:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    .line 886
    :goto_0
    return-object v1

    .line 881
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    goto :goto_0

    .line 886
    .end local v0    # "x":Ljava/io/IOException;
    :cond_0
    iget-object v1, p0, Lcom/beyond/io/http;->headerIndex:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 764
    iget-object v0, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 680
    invoke-virtual {p0}, Lcom/beyond/io/http;->checkOpened()V

    .line 681
    iget-boolean v0, p0, Lcom/beyond/io/http;->_isOpened:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Input stream already opened"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 682
    :cond_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V

    .line 683
    iget-object v0, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    if-nez v0, :cond_1

    .line 684
    new-instance v0, Ljava/io/IOException;

    const-string v1, "not OK response"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 687
    :cond_1
    iget-object v0, p0, Lcom/beyond/io/http;->_iis:Lcom/beyond/io/http$InnerInputStream;

    if-nez v0, :cond_2

    .line 688
    new-instance v0, Lcom/beyond/io/http$InnerInputStream;

    iget-object v1, p0, Lcom/beyond/io/http;->input:Lcom/beyond/io/http$BufferedInputStream;

    invoke-direct {v0, p0, p0, v1}, Lcom/beyond/io/http$InnerInputStream;-><init>(Lcom/beyond/io/http;Lcom/beyond/io/http;Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/beyond/io/http;->_iis:Lcom/beyond/io/http$InnerInputStream;

    .line 689
    iget v0, p0, Lcom/beyond/io/http;->opens:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/beyond/io/http;->opens:I

    .line 691
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/http;->_isOpened:Z

    .line 692
    iget-object v0, p0, Lcom/beyond/io/http;->_iis:Lcom/beyond/io/http$InnerInputStream;

    return-object v0
.end method

.method public getLastModified()J
    .locals 3

    .prologue
    .line 859
    const-string v0, "last-modified"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/beyond/io/http;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLength()J
    .locals 3

    .prologue
    .line 833
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 835
    const-string v1, "content-length"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Lcom/beyond/io/http;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result v1

    int-to-long v1, v1

    :goto_0
    return-wide v1

    .line 834
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    const-wide/16 v1, -0x1

    goto :goto_0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 697
    invoke-virtual {p0}, Lcom/beyond/io/http;->checkOpened()V

    .line 698
    iget-boolean v0, p0, Lcom/beyond/io/http;->_osOpened:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Output stream already opened"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 699
    :cond_0
    iget-object v0, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    if-nez v0, :cond_1

    .line 700
    new-instance v0, Lcom/beyond/io/http$InnerOutputStream;

    invoke-direct {v0, p0, p0}, Lcom/beyond/io/http$InnerOutputStream;-><init>(Lcom/beyond/io/http;Lcom/beyond/io/http;)V

    iput-object v0, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    .line 701
    iget v0, p0, Lcom/beyond/io/http;->opens:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/beyond/io/http;->opens:I

    .line 703
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/http;->_osOpened:Z

    .line 704
    iget-object v0, p0, Lcom/beyond/io/http;->_ios:Lcom/beyond/io/http$InnerOutputStream;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 780
    iget v0, p0, Lcom/beyond/io/http;->port:I

    return v0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 760
    iget-object v0, p0, Lcom/beyond/io/http;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1

    .prologue
    .line 776
    iget-object v0, p0, Lcom/beyond/io/http;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getRef()Ljava/lang/String;
    .locals 1

    .prologue
    .line 772
    iget-object v0, p0, Lcom/beyond/io/http;->ref:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 784
    iget-object v0, p0, Lcom/beyond/io/http;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 807
    iget-object v0, p0, Lcom/beyond/io/http;->reqProperties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 823
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V

    .line 824
    iget v0, p0, Lcom/beyond/io/http;->responseCode:I

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 828
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V

    .line 829
    iget-object v0, p0, Lcom/beyond/io/http;->responseMsg:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 839
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 841
    const-string v1, "content-type"

    invoke-virtual {p0, v1}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    .line 840
    :catch_0
    move-exception v0

    .local v0, "x":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 756
    iget-object v0, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    return-object v0
.end method

.method public isRelocatable()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 925
    const/4 v1, 0x0

    .line 928
    .local v1, "rescode":I
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 933
    packed-switch v1, :pswitch_data_0

    .line 939
    :goto_0
    return v2

    .line 929
    :catch_0
    move-exception v0

    .line 930
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0

    .line 937
    .end local v0    # "e":Ljava/io/IOException;
    :pswitch_0
    const/4 v2, 0x1

    goto :goto_0

    .line 933
    :pswitch_data_0
    .packed-switch 0x12d
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 1312
    const/4 v0, 0x1

    return v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 615
    iget-boolean v2, p0, Lcom/beyond/io/http;->opened:Z

    if-eqz v2, :cond_0

    .line 616
    new-instance v2, Ljava/io/IOException;

    const-string v3, "already connected"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 622
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 623
    .local v1, "len":I
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 624
    .local v0, "idx":I
    if-lez v0, :cond_1

    sub-int v2, v1, v0

    const/4 v3, 0x5

    if-ne v2, v3, :cond_1

    .line 625
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ":wire"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 626
    iput-boolean v4, p0, Lcom/beyond/io/http;->wire:Z

    .line 627
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 630
    :cond_1
    iput-object p1, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    .line 637
    iget v2, p0, Lcom/beyond/io/http;->opens:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/beyond/io/http;->opens:I

    .line 638
    iput-boolean v4, p0, Lcom/beyond/io/http;->opened:Z

    .line 640
    invoke-virtual {p0}, Lcom/beyond/io/http;->parseURL()V

    .line 642
    new-instance v2, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "http:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/beyond/io/http;->url:Ljava/lang/String;

    .line 645
    iget-object v2, p0, Lcom/beyond/io/http;->reqProperties:Ljava/util/Hashtable;

    const-string v3, "Host"

    iget-object v4, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    return-object p0
.end method

.method protected declared-synchronized parseURL()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1293
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput v0, p0, Lcom/beyond/io/http;->_url_idx:I

    .line 1294
    invoke-direct {p0}, Lcom/beyond/io/http;->parseHostname()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/io/http;->host:Ljava/lang/String;

    .line 1295
    invoke-direct {p0}, Lcom/beyond/io/http;->parsePort()I

    move-result v0

    iput v0, p0, Lcom/beyond/io/http;->port:I

    .line 1296
    invoke-direct {p0}, Lcom/beyond/io/http;->parseFile()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/io/http;->file:Ljava/lang/String;

    .line 1297
    invoke-direct {p0}, Lcom/beyond/io/http;->parseQuery()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/io/http;->query:Ljava/lang/String;

    .line 1298
    invoke-direct {p0}, Lcom/beyond/io/http;->parseRef()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/io/http;->ref:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1299
    monitor-exit p0

    return-void

    .line 1293
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized realClose()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 663
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/beyond/io/http;->opens:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/beyond/io/http;->opens:I

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/beyond/io/http;->connected:Z

    if-eqz v0, :cond_0

    .line 665
    invoke-virtual {p0}, Lcom/beyond/io/http;->disconnect()V

    .line 666
    sget-object v0, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    if-eqz v0, :cond_0

    .line 667
    sget-object v0, Lcom/beyond/io/http;->connectionPool:Lcom/beyond/io/http$HttpConnectionManager;

    iget-object v1, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    invoke-virtual {v0, v1}, Lcom/beyond/io/http$HttpConnectionManager;->returnConnection(Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;)V

    .line 668
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/http;->curConn:Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 671
    :cond_0
    monitor-exit p0

    return-void

    .line 663
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public relocation()Lorg/kwis/msf/io/HttpSocket;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 944
    invoke-virtual {p0}, Lcom/beyond/io/http;->getRequestMethod()Ljava/lang/String;

    move-result-object v2

    .line 945
    .local v2, "method":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/beyond/io/http;->isRelocatable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 946
    const/4 v1, 0x0

    .line 971
    :cond_0
    :goto_0
    return-object v1

    .line 948
    :cond_1
    invoke-virtual {p0}, Lcom/beyond/io/http;->getResponseCode()I

    move-result v0

    .line 950
    .local v0, "code":I
    const/16 v4, 0x12f

    if-ne v0, v4, :cond_2

    .line 951
    const-string v2, "GET"

    .line 955
    :cond_2
    const-string v4, "Location"

    invoke-virtual {p0, v4}, Lcom/beyond/io/http;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 956
    .local v3, "url":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v4, p0, Lcom/beyond/io/http;->wire:Z

    if-eqz v4, :cond_3

    const-string v4, ":wire"

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 964
    invoke-static {v3}, Lcom/beyond/io/http;->findSchemeSecure(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v1

    check-cast v1, Lorg/kwis/msf/io/HttpSocket;

    .line 965
    .local v1, "hc":Lorg/kwis/msf/io/HttpSocket;
    invoke-interface {v1, v2}, Lorg/kwis/msf/io/HttpSocket;->setRequestMethod(Ljava/lang/String;)V

    .line 966
    iget-object v4, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 968
    iget-object v4, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    iget v5, p0, Lcom/beyond/io/http;->proxyPort:I

    invoke-interface {v1, v4, v5}, Lorg/kwis/msf/io/HttpSocket;->setProxy(Ljava/lang/String;I)V

    goto :goto_0

    .line 956
    .end local v1    # "hc":Lorg/kwis/msf/io/HttpSocket;
    :cond_3
    const-string v4, ""

    goto :goto_1
.end method

.method public setProxy(Ljava/lang/String;I)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 916
    invoke-virtual {p0}, Lcom/beyond/io/http;->checkOpened()V

    .line 917
    iget-boolean v0, p0, Lcom/beyond/io/http;->connected:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "connection already open"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 918
    :cond_0
    if-eqz p1, :cond_1

    .line 919
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/beyond/io/http;->proxyHost:Ljava/lang/String;

    .line 921
    :cond_1
    iput p2, p0, Lcom/beyond/io/http;->proxyPort:I

    .line 922
    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .locals 3
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 788
    invoke-virtual {p0}, Lcom/beyond/io/http;->checkOpened()V

    .line 789
    iget-boolean v0, p0, Lcom/beyond/io/http;->connected:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "connection already open"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 791
    :cond_0
    const-string v0, "HEAD"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 792
    const-string v0, "GET"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 793
    const-string v0, "POST"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 794
    const-string v0, "CONNECT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 795
    const-string v0, "PUT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 796
    const-string v0, "DELETE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 797
    const-string v0, "TRACE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 798
    const-string v0, "OPTIONS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 800
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unsupported method: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 803
    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/beyond/io/http;->method:Ljava/lang/String;

    .line 804
    return-void
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 811
    invoke-virtual {p0}, Lcom/beyond/io/http;->checkOpened()V

    .line 812
    iget-boolean v0, p0, Lcom/beyond/io/http;->connected:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "connection already open"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 814
    :cond_0
    if-eqz p1, :cond_1

    invoke-direct {p0, p1}, Lcom/beyond/io/http;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "connection"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 815
    invoke-direct {p0, p2}, Lcom/beyond/io/http;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "close"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 816
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/http;->closeConnection:Z

    .line 819
    :cond_1
    iget-object v0, p0, Lcom/beyond/io/http;->reqProperties:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 820
    return-void
.end method
