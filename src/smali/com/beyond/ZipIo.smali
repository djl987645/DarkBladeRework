.class public Lcom/beyond/ZipIo;
.super Ljava/lang/Object;
.source "ZipIo.java"


# instance fields
.field private exist_res_dat:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/ZipIo;->exist_res_dat:Z

    .line 17
    return-void
.end method


# virtual methods
.method public getInputStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-string v0, "res.dat"

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/beyond/ZipIo;->getInputStream(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "dataName"    # Ljava/lang/String;

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/beyond/ZipIo;->getInputStream(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getInputStream(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Ljava/io/InputStream;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "dataName"    # Ljava/lang/String;
    .param p4, "isRes"    # Z

    .prologue
    const/4 v8, 0x0

    .line 34
    monitor-enter p0

    if-eqz p4, :cond_0

    .line 35
    :try_start_0
    iget-boolean v9, p0, Lcom/beyond/ZipIo;->exist_res_dat:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v9, :cond_0

    move-object v3, v8

    .line 171
    :goto_0
    monitor-exit p0

    return-object v3

    .line 135
    :cond_0
    const/4 v3, 0x0

    .line 137
    .local v3, "is":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, p3, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v3

    .line 138
    if-nez v3, :cond_2

    .line 139
    if-eqz p4, :cond_1

    .line 140
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/beyond/ZipIo;->exist_res_dat:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    :cond_1
    if-eqz v3, :cond_9

    .line 166
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 167
    const/4 v4, 0x0

    .end local v3    # "is":Ljava/io/InputStream;
    .local v4, "is":Ljava/io/InputStream;
    goto :goto_0

    .line 168
    .end local v4    # "is":Ljava/io/InputStream;
    .restart local v3    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v8

    move-object v4, v3

    .end local v3    # "is":Ljava/io/InputStream;
    .restart local v4    # "is":Ljava/io/InputStream;
    goto :goto_0

    .line 143
    .end local v4    # "is":Ljava/io/InputStream;
    .restart local v3    # "is":Ljava/io/InputStream;
    :cond_2
    :try_start_3
    new-instance v5, Ljava/util/jar/JarInputStream;

    invoke-direct {v5, v3}, Ljava/util/jar/JarInputStream;-><init>(Ljava/io/InputStream;)V

    .line 144
    .local v5, "jis":Ljava/util/jar/JarInputStream;
    const/4 v2, 0x0

    .line 145
    .local v2, "entry":Ljava/util/jar/JarEntry;
    :cond_3
    invoke-virtual {v5}, Ljava/util/jar/JarInputStream;->getNextJarEntry()Ljava/util/jar/JarEntry;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v2

    if-nez v2, :cond_5

    .line 164
    if-eqz v3, :cond_4

    .line 166
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 167
    const/4 v3, 0x0

    .end local v2    # "entry":Ljava/util/jar/JarEntry;
    .end local v5    # "jis":Ljava/util/jar/JarInputStream;
    :cond_4
    :goto_1
    move-object v3, v8

    .line 171
    goto :goto_0

    .line 146
    .restart local v2    # "entry":Ljava/util/jar/JarEntry;
    .restart local v5    # "jis":Ljava/util/jar/JarInputStream;
    :cond_5
    :try_start_5
    invoke-virtual {v2}, Ljava/util/jar/JarEntry;->isDirectory()Z

    move-result v9

    if-nez v9, :cond_3

    invoke-virtual {v2}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 147
    invoke-virtual {v2}, Ljava/util/jar/JarEntry;->getSize()J

    move-result-wide v9

    long-to-int v1, v9

    .line 148
    .local v1, "dataLen":I
    new-array v7, v1, [B

    .line 149
    .local v7, "res":[B
    const/4 v6, 0x0

    .line 150
    .local v6, "readLen":I
    :goto_2
    if-lt v6, v1, :cond_7

    .line 154
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 164
    .local v0, "bis":Ljava/io/ByteArrayInputStream;
    if-eqz v3, :cond_6

    .line 166
    :try_start_6
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 167
    const/4 v3, 0x0

    :cond_6
    :goto_3
    move-object v3, v0

    .line 155
    goto :goto_0

    .line 151
    .end local v0    # "bis":Ljava/io/ByteArrayInputStream;
    :cond_7
    sub-int v9, v1, v6

    :try_start_7
    invoke-virtual {v5, v7, v6, v9}, Ljava/util/jar/JarInputStream;->read([BII)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v9

    add-int/2addr v6, v9

    goto :goto_2

    .line 160
    .end local v1    # "dataLen":I
    .end local v2    # "entry":Ljava/util/jar/JarEntry;
    .end local v5    # "jis":Ljava/util/jar/JarInputStream;
    .end local v6    # "readLen":I
    .end local v7    # "res":[B
    :catch_1
    move-exception v9

    .line 164
    if-eqz v3, :cond_4

    .line 166
    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 167
    const/4 v3, 0x0

    goto :goto_1

    .line 163
    :catchall_0
    move-exception v8

    .line 164
    if-eqz v3, :cond_8

    .line 166
    :try_start_9
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 167
    const/4 v3, 0x0

    .line 170
    :cond_8
    :goto_4
    :try_start_a
    throw v8
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 34
    .end local v3    # "is":Ljava/io/InputStream;
    :catchall_1
    move-exception v8

    monitor-exit p0

    throw v8

    .line 168
    .restart local v0    # "bis":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "dataLen":I
    .restart local v2    # "entry":Ljava/util/jar/JarEntry;
    .restart local v3    # "is":Ljava/io/InputStream;
    .restart local v5    # "jis":Ljava/util/jar/JarInputStream;
    .restart local v6    # "readLen":I
    .restart local v7    # "res":[B
    :catch_2
    move-exception v8

    goto :goto_3

    .end local v0    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v1    # "dataLen":I
    .end local v2    # "entry":Ljava/util/jar/JarEntry;
    .end local v5    # "jis":Ljava/util/jar/JarInputStream;
    .end local v6    # "readLen":I
    .end local v7    # "res":[B
    :catch_3
    move-exception v9

    goto :goto_1

    :catch_4
    move-exception v9

    goto :goto_4

    .restart local v2    # "entry":Ljava/util/jar/JarEntry;
    .restart local v5    # "jis":Ljava/util/jar/JarInputStream;
    :catch_5
    move-exception v9

    goto :goto_1

    .end local v2    # "entry":Ljava/util/jar/JarEntry;
    .end local v5    # "jis":Ljava/util/jar/JarInputStream;
    :cond_9
    move-object v4, v3

    .end local v3    # "is":Ljava/io/InputStream;
    .restart local v4    # "is":Ljava/io/InputStream;
    goto :goto_0
.end method
