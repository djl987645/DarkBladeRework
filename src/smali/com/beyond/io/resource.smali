.class public Lcom/beyond/io/resource;
.super Lcom/beyond/io/SocketModel;
.source "resource.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# instance fields
.field name:Ljava/lang/String;

.field private opened:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/resource;->opened:Z

    .line 14
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    return-void
.end method

.method public control([B[B)I
    .locals 6
    .param p1, "param0"    # [B
    .param p2, "param1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 76
    iget-object v2, p0, Lcom/beyond/io/resource;->name:Ljava/lang/String;

    const-string v3, "//sys_prop/get"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 77
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    .line 78
    .local v0, "command":Ljava/lang/String;
    const-string v2, "MEDIADEVICES"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    const-string v2, "media://getDevices"

    invoke-static {v2}, Lorg/kwis/msf/io/URL;->find(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v1

    check-cast v1, Lcom/beyond/io/SocketModel;

    .line 80
    .local v1, "soc":Lcom/beyond/io/SocketModel;
    invoke-virtual {v1}, Lcom/beyond/io/SocketModel;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/io/InputStream;->read([B)I

    .line 89
    .end local v1    # "soc":Lcom/beyond/io/SocketModel;
    :goto_0
    return v4

    .line 83
    :cond_0
    const-string v2, "VOLUMELEVEL"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 84
    new-instance v2, Ljava/lang/String;

    const-string v3, "1"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v4, p2, v5}, Ljava/lang/String;->getBytes(II[BI)V

    goto :goto_0

    .line 87
    :cond_1
    const-string v2, "VIBRATORLEVEL"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 88
    new-instance v2, Ljava/lang/String;

    const-string v3, "1"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v4, p2, v5}, Ljava/lang/String;->getBytes(II[BI)V

    goto :goto_0

    .line 93
    .end local v0    # "command":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/io/IOException;

    const-string v3, "not support"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    iget-object v1, p0, Lcom/beyond/io/resource;->name:Ljava/lang/String;

    .line 31
    .local v1, "res_name":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_0

    .line 32
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 34
    :cond_0
    invoke-static {v1}, Lcom/beyond/JletActivity;->getResource(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 35
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_1

    .line 43
    .end local v0    # "is":Ljava/io/InputStream;
    :goto_0
    return-object v0

    .line 38
    .restart local v0    # "is":Ljava/io/InputStream;
    :cond_1
    iget-object v3, p0, Lcom/beyond/io/resource;->name:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/beyond/io/resource;->getResource(Ljava/lang/String;)[B

    move-result-object v2

    .line 40
    .local v2, "resource":[B
    if-nez v2, :cond_2

    .line 41
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    throw v3

    .line 43
    :cond_2
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .end local v0    # "is":Ljava/io/InputStream;
    invoke-direct {v0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_0
.end method

.method public declared-synchronized getResource(Ljava/lang/String;)[B
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 53
    monitor-enter p0

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2f

    if-ne v4, v5, :cond_0

    .line 54
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 56
    :cond_0
    const/4 v1, 0x0

    .line 57
    .local v1, "is":Ljava/io/InputStream;
    invoke-static {p1}, Lcom/beyond/JletActivity;->getResource(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 58
    if-nez v1, :cond_1

    move-object v2, v3

    .line 72
    :goto_0
    monitor-exit p0

    return-object v2

    .line 65
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    move-result v4

    new-array v2, v4, [B

    .line 66
    .local v2, "resource":[B
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 69
    .end local v2    # "resource":[B
    :catch_0
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v2, v3

    .line 72
    goto :goto_0

    .line 53
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "is":Ljava/io/InputStream;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    iput-object p1, p0, Lcom/beyond/io/resource;->name:Ljava/lang/String;

    .line 24
    return-object p0
.end method
