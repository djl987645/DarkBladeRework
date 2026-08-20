.class public Lcom/beyond/io/BBillSocket$InnerInputStream;
.super Ljava/io/InputStream;
.source "BBillSocket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/BBillSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InnerInputStream"
.end annotation


# static fields
.field private static final RCV_HEADER_LENGTH:I = 0x38


# instance fields
.field bytesLeft:I

.field headerBuff:[B

.field headerOffset:I

.field protected in:Ljava/io/InputStream;

.field final synthetic this$0:Lcom/beyond/io/BBillSocket;


# direct methods
.method public constructor <init>(Lcom/beyond/io/BBillSocket;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 95
    iput-object p1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->in:Ljava/io/InputStream;

    .line 91
    const/16 v0, 0x38

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    .line 92
    iput v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    .line 93
    iput v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    .line 95
    return-void
.end method

.method private declared-synchronized readHeader()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    .line 169
    monitor-enter p0

    :try_start_0
    iget v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    array-length v6, v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v5, v6, :cond_1

    .line 220
    :cond_0
    monitor-exit p0

    return-void

    .line 173
    :cond_1
    const/4 v5, 0x0

    :try_start_1
    iput v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    const/4 v3, 0x0

    .line 177
    .local v3, "n":I
    :goto_0
    :try_start_2
    iget v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    array-length v6, v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-lt v5, v6, :cond_2

    .line 190
    :try_start_3
    iget v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    array-length v6, v6

    if-ne v5, v6, :cond_0

    .line 194
    const/4 v5, 0x0

    iput v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    .line 197
    iget-object v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    const/16 v6, 0x30

    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x18

    .line 198
    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    const/16 v7, 0x31

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    add-int/2addr v5, v6

    .line 199
    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    const/16 v7, 0x32

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    add-int/2addr v5, v6

    .line 200
    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    const/16 v7, 0x33

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    add-int/2addr v5, v6

    .line 197
    iput v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    .line 203
    const/4 v5, 0x4

    new-array v0, v5, [B

    .line 204
    .local v0, "bCode":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-lt v2, v10, :cond_3

    .line 207
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    .line 208
    .local v4, "svcCode":Ljava/lang/String;
    if-nez v4, :cond_0

    new-instance v5, Ljava/io/IOException;

    const-string v6, "I/O Exception: read null"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 169
    .end local v0    # "bCode":[B
    .end local v2    # "i":I
    .end local v3    # "n":I
    .end local v4    # "svcCode":Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 179
    .restart local v3    # "n":I
    :cond_2
    :try_start_4
    iget-object v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->in:Ljava/io/InputStream;

    iget-object v6, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    iget v7, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    iget-object v8, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    array-length v8, v8

    iget v9, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    sub-int/2addr v8, v9

    invoke-virtual {v5, v6, v7, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 181
    if-ltz v3, :cond_0

    .line 183
    iget v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerOffset:I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 185
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/Exception;
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 187
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 205
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "bCode":[B
    .restart local v2    # "i":I
    :cond_3
    iget-object v5, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->headerBuff:[B

    add-int/lit8 v6, v2, 0x34

    aget-byte v5, v5, v6

    aput-byte v5, v0, v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 204
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    :try_start_0
    iget-object v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    return-void

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->this$0:Lcom/beyond/io/BBillSocket;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/beyond/io/BBillSocket;->access$1(Lcom/beyond/io/BBillSocket;Lorg/kwis/msf/io/Socket;)V

    .line 227
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 228
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 98
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-static {v2}, Lcom/beyond/io/BBillSocket;->access$0(Lcom/beyond/io/BBillSocket;)Lorg/kwis/msf/io/Socket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-nez v2, :cond_0

    .line 106
    :goto_0
    monitor-exit p0

    return-object v1

    .line 100
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-static {v1}, Lcom/beyond/io/BBillSocket;->access$0(Lcom/beyond/io/BBillSocket;)Lorg/kwis/msf/io/Socket;

    move-result-object v1

    invoke-interface {v1}, Lorg/kwis/msf/io/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->in:Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, p0

    .line 106
    goto :goto_0

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v1, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->this$0:Lcom/beyond/io/BBillSocket;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/beyond/io/BBillSocket;->access$1(Lcom/beyond/io/BBillSocket;Lorg/kwis/msf/io/Socket;)V

    .line 103
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 104
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 111
    new-array v1, v2, [B

    .line 114
    .local v1, "one":[B
    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {p0, v1, v2, v3}, Lcom/beyond/io/BBillSocket$InnerInputStream;->read([BII)I

    move-result v2

    if-lez v2, :cond_0

    .line 115
    const/4 v2, 0x0

    aget-byte v2, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit16 v2, v2, 0xff

    .line 119
    :goto_0
    return v2

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 119
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "abyte0"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/beyond/io/BBillSocket$InnerInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public declared-synchronized read([BII)I
    .locals 5
    .param p1, "abyte0"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v3, -0x1

    .line 128
    monitor-enter p0

    if-nez p3, :cond_0

    .line 160
    :goto_0
    monitor-exit p0

    return v0

    .line 130
    :cond_0
    :try_start_0
    iget v4, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    if-gtz v4, :cond_1

    invoke-direct {p0}, Lcom/beyond/io/BBillSocket$InnerInputStream;->readHeader()V

    .line 133
    :cond_1
    iget v4, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    if-gtz v4, :cond_2

    invoke-direct {p0}, Lcom/beyond/io/BBillSocket$InnerInputStream;->readHeader()V

    .line 136
    :cond_2
    iget v4, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    if-gtz v4, :cond_3

    .line 137
    const/4 v4, 0x0

    iput v4, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    move v0, v3

    .line 138
    goto :goto_0

    .line 142
    :cond_3
    move v2, p3

    .line 143
    .local v2, "reading":I
    iget v4, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    if-ge v4, p3, :cond_4

    .line 144
    iget v2, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    :cond_4
    :try_start_1
    iget-object v4, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4, p1, p2, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 150
    .local v0, "count":I
    if-gez v0, :cond_5

    move v0, v3

    .line 151
    goto :goto_0

    .line 152
    :cond_5
    iget v3, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/beyond/io/BBillSocket$InnerInputStream;->bytesLeft:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 161
    .end local v0    # "count":I
    :catch_0
    move-exception v1

    .line 162
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 163
    new-instance v3, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 128
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "reading":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
