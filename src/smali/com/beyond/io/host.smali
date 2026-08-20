.class public Lcom/beyond/io/host;
.super Ljava/lang/Object;
.source "host.java"


# static fields
.field static final DNS_TIMEOUT:J = 0x1388L

.field private static dns_timeout:J

.field private static iparr:[I

.field private static ttlarr:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x5

    .line 10
    const-wide/16 v0, 0x1388

    sput-wide v0, Lcom/beyond/io/host;->dns_timeout:J

    .line 11
    new-array v0, v2, [I

    sput-object v0, Lcom/beyond/io/host;->iparr:[I

    .line 12
    new-array v0, v2, [I

    sput-object v0, Lcom/beyond/io/host;->ttlarr:[I

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native addIntoHostTable(Ljava/lang/String;[I[II)V
.end method

.method private static native analysisWithTTL(Ljava/lang/String;[BI[I[I)I
.end method

.method private static native convert(Ljava/lang/String;)I
.end method

.method private static native getDNSServerIP(I)I
.end method

.method private static native getDNSTimeout()J
.end method

.method private static native getDefaultDNSServerIP()I
.end method

.method protected static getHostIP(Ljava/lang/String;)I
    .locals 11
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    const/4 v5, -0x1

    .line 16
    if-nez p0, :cond_1

    move v3, v5

    .line 74
    :cond_0
    :goto_0
    return v3

    .line 20
    :cond_1
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 21
    .local v0, "c":C
    const/16 v6, 0x30

    if-lt v0, v6, :cond_2

    const/16 v6, 0x39

    if-gt v0, v6, :cond_2

    .line 22
    invoke-static {p0}, Lcom/beyond/io/host;->convert(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 24
    :cond_2
    const-string v6, "localhost"

    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 25
    const-string v5, "127.0.0.1"

    invoke-static {v5}, Lcom/beyond/io/host;->convert(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 29
    :cond_3
    invoke-static {p0}, Lcom/beyond/io/host;->getSavedIP(Ljava/lang/String;)I

    move-result v3

    .line 30
    .local v3, "ip":I
    if-ne v3, v5, :cond_0

    .line 31
    const/4 v4, 0x0

    .line 34
    .local v4, "noNameServer":Z
    :try_start_0
    invoke-static {}, Lcom/beyond/io/host;->getDNSTimeout()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    mul-long/2addr v6, v8

    sput-wide v6, Lcom/beyond/io/host;->dns_timeout:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    :goto_1
    sget-wide v6, Lcom/beyond/io/host;->dns_timeout:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-gez v6, :cond_4

    .line 38
    const-wide/16 v6, 0x1388

    sput-wide v6, Lcom/beyond/io/host;->dns_timeout:J

    .line 42
    :cond_4
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    const/4 v6, 0x3

    if-lt v2, v6, :cond_5

    move v3, v5

    .line 72
    goto :goto_0

    .line 43
    :cond_5
    const/4 v6, 0x1

    if-lt v2, v6, :cond_6

    .line 44
    add-int/lit8 v6, v2, -0x1

    invoke-static {v6}, Lcom/beyond/io/host;->getDNSServerIP(I)I

    move-result v3

    .line 48
    :goto_3
    if-ne v3, v5, :cond_8

    .line 50
    invoke-static {}, Lcom/beyond/io/host;->getDefaultDNSServerIP()I

    move-result v3

    .line 51
    if-ne v3, v5, :cond_7

    move v3, v5

    .line 52
    goto :goto_0

    .line 46
    :cond_6
    invoke-static {v2}, Lcom/beyond/io/host;->getDNSServerIP(I)I

    move-result v3

    goto :goto_3

    .line 54
    :cond_7
    const/4 v4, 0x1

    .line 61
    :cond_8
    sget-object v6, Lcom/beyond/io/host;->iparr:[I

    sget-object v7, Lcom/beyond/io/host;->ttlarr:[I

    invoke-static {p0, v3, v6, v7}, Lcom/beyond/io/host;->resolve(Ljava/lang/String;I[I[I)I

    move-result v1

    .line 62
    .local v1, "cnt":I
    if-gtz v1, :cond_9

    .line 63
    if-eqz v4, :cond_a

    move v3, v5

    .line 64
    goto :goto_0

    .line 69
    :cond_9
    sget-object v5, Lcom/beyond/io/host;->iparr:[I

    sget-object v6, Lcom/beyond/io/host;->ttlarr:[I

    invoke-static {p0, v5, v6, v1}, Lcom/beyond/io/host;->addIntoHostTable(Ljava/lang/String;[I[II)V

    .line 70
    sget-object v5, Lcom/beyond/io/host;->iparr:[I

    aget v3, v5, v10

    goto :goto_0

    .line 42
    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 35
    .end local v1    # "cnt":I
    .end local v2    # "i":I
    :catch_0
    move-exception v6

    goto :goto_1
.end method

.method private static native getSavedIP(Ljava/lang/String;)I
.end method

.method private static native mkquery(Ljava/lang/String;[BI)I
.end method

.method private static declared-synchronized resolve(Ljava/lang/String;I[I[I)I
    .locals 11
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "serverip"    # I
    .param p2, "iparr"    # [I
    .param p3, "ttlarr"    # [I

    .prologue
    const/4 v6, -0x1

    .line 80
    const-class v7, Lcom/beyond/io/host;

    monitor-enter v7

    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "datagram://:53/rw/"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v9, Lcom/beyond/io/host;->dns_timeout:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 81
    .local v5, "url":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    shr-int/lit8 v9, p1, 0x18

    and-int/lit16 v9, v9, 0xff

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 83
    shr-int/lit8 v9, p1, 0x10

    and-int/lit16 v9, v9, 0xff

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 84
    shr-int/lit8 v9, p1, 0x8

    and-int/lit16 v9, v9, 0xff

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 85
    and-int/lit16 v9, p1, 0xff

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":53"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 81
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v3

    .line 87
    .local v3, "server":Ljava/lang/String;
    const/4 v4, 0x0

    .line 89
    .local v4, "sock":Lorg/kwis/msf/io/Socket;
    :try_start_1
    new-instance v2, Lorg/kwis/msf/io/Message;

    const/16 v8, 0x400

    new-array v8, v8, [B

    invoke-direct {v2, v3, v8}, Lorg/kwis/msf/io/Message;-><init>(Ljava/lang/String;[B)V

    .line 90
    .local v2, "msg":Lorg/kwis/msf/io/Message;
    invoke-virtual {v2}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v8

    invoke-virtual {v2}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v9

    invoke-static {p0, v8, v9}, Lcom/beyond/io/host;->mkquery(Ljava/lang/String;[BI)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    .line 91
    .local v1, "len":I
    if-gtz v1, :cond_1

    .line 104
    if-eqz v4, :cond_0

    .line 106
    :try_start_2
    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 102
    .end local v1    # "len":I
    .end local v2    # "msg":Lorg/kwis/msf/io/Message;
    :cond_0
    :goto_0
    monitor-exit v7

    return v6

    .line 94
    .restart local v1    # "len":I
    .restart local v2    # "msg":Lorg/kwis/msf/io/Message;
    :cond_1
    :try_start_3
    invoke-virtual {v2, v1}, Lorg/kwis/msf/io/Message;->setLength(I)I

    .line 96
    invoke-static {v5}, Lorg/kwis/msf/io/URL;->find(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v4

    .line 97
    invoke-interface {v4, v2}, Lorg/kwis/msf/io/Socket;->send(Lorg/kwis/msf/io/Message;)V

    .line 98
    invoke-virtual {v2}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v8

    array-length v8, v8

    invoke-virtual {v2, v8}, Lorg/kwis/msf/io/Message;->setLength(I)I

    .line 99
    invoke-interface {v4, v2}, Lorg/kwis/msf/io/Socket;->recv(Lorg/kwis/msf/io/Message;)V

    .line 100
    invoke-virtual {v2}, Lorg/kwis/msf/io/Message;->getData()[B

    move-result-object v8

    invoke-virtual {v2}, Lorg/kwis/msf/io/Message;->getLength()I

    move-result v9

    invoke-static {p0, v8, v9, p2, p3}, Lcom/beyond/io/host;->analysisWithTTL(Ljava/lang/String;[BI[I[I)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v6

    .line 104
    if-eqz v4, :cond_0

    .line 106
    :try_start_4
    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 107
    :catch_0
    move-exception v8

    goto :goto_0

    .line 101
    .end local v1    # "len":I
    .end local v2    # "msg":Lorg/kwis/msf/io/Message;
    :catch_1
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    if-eqz v4, :cond_0

    .line 106
    :try_start_5
    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    .line 107
    :catch_2
    move-exception v8

    goto :goto_0

    .line 103
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 104
    if-eqz v4, :cond_2

    .line 106
    :try_start_6
    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 110
    :cond_2
    :goto_1
    :try_start_7
    throw v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 80
    .end local v3    # "server":Ljava/lang/String;
    .end local v4    # "sock":Lorg/kwis/msf/io/Socket;
    .end local v5    # "url":Ljava/lang/String;
    :catchall_1
    move-exception v6

    monitor-exit v7

    throw v6

    .line 107
    .restart local v1    # "len":I
    .restart local v2    # "msg":Lorg/kwis/msf/io/Message;
    .restart local v3    # "server":Ljava/lang/String;
    .restart local v4    # "sock":Lorg/kwis/msf/io/Socket;
    .restart local v5    # "url":Ljava/lang/String;
    :catch_3
    move-exception v8

    goto :goto_0

    .end local v1    # "len":I
    .end local v2    # "msg":Lorg/kwis/msf/io/Message;
    :catch_4
    move-exception v8

    goto :goto_1
.end method
