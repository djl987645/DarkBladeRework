.class public Lcom/beyond/io/http$HttpConnectionManager;
.super Ljava/lang/Object;
.source "http.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/http;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HttpConnectionManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    }
.end annotation


# static fields
.field static final DEFAULT_MAX_CONNECTION:I = 0xa


# instance fields
.field private _conns:Ljava/util/Vector;

.field private _maxConns:I

.field final synthetic this$0:Lcom/beyond/io/http;


# direct methods
.method constructor <init>(Lcom/beyond/io/http;)V
    .locals 1

    .prologue
    .line 219
    iput-object p1, p0, Lcom/beyond/io/http$HttpConnectionManager;->this$0:Lcom/beyond/io/http;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    .line 221
    const/16 v0, 0xa

    iput v0, p0, Lcom/beyond/io/http$HttpConnectionManager;->_maxConns:I

    .line 222
    return-void
.end method

.method constructor <init>(Lcom/beyond/io/http;I)V
    .locals 1
    .param p2, "maxConnection"    # I

    .prologue
    .line 223
    iput-object p1, p0, Lcom/beyond/io/http$HttpConnectionManager;->this$0:Lcom/beyond/io/http;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, p2}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    .line 226
    const/16 v0, 0xa

    iput v0, p0, Lcom/beyond/io/http$HttpConnectionManager;->_maxConns:I

    .line 228
    return-void
.end method


# virtual methods
.method public declared-synchronized close(I)V
    .locals 7
    .param p1, "appID"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 488
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v3

    .line 490
    .local v3, "numOfConnection":I
    if-lez v3, :cond_1

    .line 491
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 492
    .local v0, "connEnum":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_2

    .line 529
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_1
    monitor-exit p0

    return-void

    .line 493
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_2
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 496
    .local v2, "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    iget v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    if-ne v4, p1, :cond_0

    .line 497
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_3

    .line 499
    :try_start_2
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    invoke-virtual {v4}, Lcom/beyond/io/http$BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 503
    :goto_1
    const/4 v4, 0x0

    :try_start_3
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    .line 505
    :cond_3
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_4

    .line 507
    :try_start_4
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 511
    :goto_2
    const/4 v4, 0x0

    :try_start_5
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 513
    :cond_4
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v4, :cond_5

    .line 515
    :try_start_6
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 519
    :goto_3
    const/4 v4, 0x0

    :try_start_7
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 522
    :cond_5
    const/4 v4, 0x0

    iput-boolean v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    .line 523
    const/4 v4, -0x1

    iput v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    .line 524
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 525
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "remove socket"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 488
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    .end local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .end local v3    # "numOfConnection":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 500
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    .restart local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .restart local v3    # "numOfConnection":I
    :catch_0
    move-exception v1

    .line 501
    .local v1, "e":Ljava/io/IOException;
    :try_start_8
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "close failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 508
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 509
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "close failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 516
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 517
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "close failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_3
.end method

.method public declared-synchronized dump()V
    .locals 6

    .prologue
    .line 380
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    .line 382
    .local v2, "numOfConnection":I
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "---------------------------------------------"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 383
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "host\t\tport\tconnStr\tinUse\tappID\tsoc\tin\tout\t"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 384
    if-lez v2, :cond_0

    .line 386
    iget-object v3, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 387
    .local v0, "connEnum":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 396
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "---------------------------------------------"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    monitor-exit p0

    return-void

    .line 388
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_1
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 389
    .local v1, "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->host:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->port:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 390
    iget-object v5, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->connString:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v5, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 391
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    if-nez v3, :cond_2

    const-string v3, "null"

    :goto_1
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 392
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    if-nez v3, :cond_3

    const-string v3, "null"

    :goto_2
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\t"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 393
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    if-nez v3, :cond_4

    const-string v3, "null"

    :goto_3
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 389
    invoke-virtual {v4, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 380
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    .end local v1    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .end local v2    # "numOfConnection":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 391
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    .restart local v1    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .restart local v2    # "numOfConnection":I
    :cond_2
    :try_start_2
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 392
    :cond_3
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 393
    :cond_4
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    goto :goto_3
.end method

.method declared-synchronized getConnection(Ljava/lang/String;ILjava/lang/String;)Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .locals 8
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "connString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 248
    .local v4, "numOfConnection":I
    if-lez v4, :cond_1

    .line 250
    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 251
    .local v0, "connEnum":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_2

    .line 263
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_1
    iget v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_maxConns:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ge v4, v5, :cond_3

    .line 266
    :try_start_1
    new-instance v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    const/4 v5, 0x0

    invoke-direct {v2, p0, v5}, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;-><init>(Lcom/beyond/io/http$HttpConnectionManager;Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;)V

    .line 268
    .local v2, "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "socket://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/beyond/io/http;->access$7(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v5

    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 270
    new-instance v5, Ljava/io/DataOutputStream;

    iget-object v6, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v6}, Lorg/kwis/msf/io/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 271
    new-instance v5, Lcom/beyond/io/http$BufferedInputStream;

    iget-object v6, p0, Lcom/beyond/io/http$HttpConnectionManager;->this$0:Lcom/beyond/io/http;

    iget-object v7, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v7}, Lorg/kwis/msf/io/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/beyond/io/http$BufferedInputStream;-><init>(Lcom/beyond/io/http;Ljava/io/InputStream;)V

    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    .line 272
    iput-object p1, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->host:Ljava/lang/String;

    .line 273
    iput p2, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->port:I

    .line 274
    iput-object p3, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->connString:Ljava/lang/String;

    .line 275
    const/4 v5, 0x1

    iput-boolean v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    .line 277
    const/4 v5, 0x0

    iput v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    .line 278
    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v3, v2

    .line 334
    .end local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .local v3, "hce":Ljava/lang/Object;
    :goto_0
    monitor-exit p0

    return-object v3

    .line 252
    .end local v3    # "hce":Ljava/lang/Object;
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_2
    :try_start_2
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 253
    .restart local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    iget-boolean v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    if-nez v5, :cond_0

    .line 254
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->host:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 255
    iget v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->port:I

    if-ne p2, v5, :cond_0

    .line 256
    const/4 v5, 0x1

    iput-boolean v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    .line 258
    const/4 v5, 0x0

    iput v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    move-object v3, v2

    .line 259
    .restart local v3    # "hce":Ljava/lang/Object;
    goto :goto_0

    .line 281
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    .end local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .end local v3    # "hce":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "Socket open error:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 283
    const-string v7, "cur_num("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") < max_num("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 284
    iget v7, p0, Lcom/beyond/io/http$HttpConnectionManager;->_maxConns:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 282
    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 285
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Exception:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 293
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    if-lez v4, :cond_5

    .line 295
    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 296
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_4
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_6

    .line 342
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_5
    new-instance v5, Ljava/io/IOException;

    const-string v6, "all connection in use"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 246
    .end local v4    # "numOfConnection":I
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 297
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    .restart local v4    # "numOfConnection":I
    :cond_6
    :try_start_3
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 298
    .restart local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    iget-boolean v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v5, :cond_4

    .line 301
    :try_start_4
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v5, :cond_7

    .line 303
    :try_start_5
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    invoke-virtual {v5}, Lcom/beyond/io/http$BufferedInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 305
    :goto_1
    const/4 v5, 0x0

    :try_start_6
    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    .line 307
    :cond_7
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v5, :cond_8

    .line 309
    :try_start_7
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v5}, Ljava/io/DataOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 311
    :goto_2
    const/4 v5, 0x0

    :try_start_8
    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 313
    :cond_8
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-eqz v5, :cond_9

    .line 315
    :try_start_9
    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v5}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 317
    :goto_3
    const/4 v5, 0x0

    :try_start_a
    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 319
    :cond_9
    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 323
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "socket://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/beyond/io/http;->access$7(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v5

    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 324
    new-instance v5, Ljava/io/DataOutputStream;

    iget-object v6, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v6}, Lorg/kwis/msf/io/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 325
    new-instance v5, Lcom/beyond/io/http$BufferedInputStream;

    iget-object v6, p0, Lcom/beyond/io/http$HttpConnectionManager;->this$0:Lcom/beyond/io/http;

    iget-object v7, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v7}, Lorg/kwis/msf/io/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/beyond/io/http$BufferedInputStream;-><init>(Lcom/beyond/io/http;Ljava/io/InputStream;)V

    iput-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    .line 326
    iput-object p1, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->host:Ljava/lang/String;

    .line 327
    iput p2, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->port:I

    .line 328
    iput-object p3, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->connString:Ljava/lang/String;

    .line 329
    const/4 v5, 0x1

    iput-boolean v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    .line 331
    const/4 v5, 0x0

    iput v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    .line 332
    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-object v3, v2

    .line 334
    .restart local v3    # "hce":Ljava/lang/Object;
    goto/16 :goto_0

    .line 335
    .end local v3    # "hce":Ljava/lang/Object;
    :catch_1
    move-exception v1

    .line 336
    .local v1, "e":Ljava/io/IOException;
    :try_start_b
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Exception:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 337
    throw v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 316
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    goto :goto_3

    .line 310
    :catch_3
    move-exception v5

    goto :goto_2

    .line 304
    :catch_4
    move-exception v5

    goto :goto_1
.end method

.method declared-synchronized reConnect(Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;)Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .locals 7
    .param p1, "reConn"    # Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 406
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v3

    .line 408
    .local v3, "numOfConnection":I
    if-lez v3, :cond_1

    .line 410
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 411
    .local v0, "connEnum":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_2

    .line 439
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_1
    new-instance v4, Ljava/io/IOException;

    const-string v5, "connection not found"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 406
    .end local v3    # "numOfConnection":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 412
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    .restart local v3    # "numOfConnection":I
    :cond_2
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 413
    .local v2, "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    if-ne v2, p1, :cond_0

    .line 416
    :try_start_2
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    invoke-virtual {v4}, Lcom/beyond/io/http$BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 418
    :goto_0
    const/4 v4, 0x0

    :try_start_3
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 420
    :try_start_4
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 422
    :goto_1
    const/4 v4, 0x0

    :try_start_5
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 424
    :try_start_6
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 426
    :goto_2
    const/4 v4, 0x0

    :try_start_7
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 429
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "socket://"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->connString:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/beyond/io/http;->access$7(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v4

    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 430
    new-instance v4, Ljava/io/DataOutputStream;

    iget-object v5, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v5}, Lorg/kwis/msf/io/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 431
    new-instance v4, Lcom/beyond/io/http$BufferedInputStream;

    iget-object v5, p0, Lcom/beyond/io/http$HttpConnectionManager;->this$0:Lcom/beyond/io/http;

    iget-object v6, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v6}, Lorg/kwis/msf/io/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/beyond/io/http$BufferedInputStream;-><init>(Lcom/beyond/io/http;Ljava/io/InputStream;)V

    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 435
    monitor-exit p0

    return-object v2

    .line 432
    :catch_0
    move-exception v1

    .line 433
    .local v1, "e":Ljava/io/IOException;
    :try_start_8
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "reconnect failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 425
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v4

    goto :goto_2

    .line 421
    :catch_2
    move-exception v4

    goto :goto_1

    .line 417
    :catch_3
    move-exception v4

    goto :goto_0
.end method

.method public declared-synchronized reset()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 446
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v3

    .line 448
    .local v3, "numOfConnection":I
    if-lez v3, :cond_0

    .line 449
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 450
    .local v0, "connEnum":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 482
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_0
    monitor-exit p0

    return-void

    .line 451
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_1
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 452
    .local v2, "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_2

    .line 454
    :try_start_2
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    invoke-virtual {v4}, Lcom/beyond/io/http$BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 458
    :goto_1
    const/4 v4, 0x0

    :try_start_3
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    .line 460
    :cond_2
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_3

    .line 462
    :try_start_4
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 466
    :goto_2
    const/4 v4, 0x0

    :try_start_5
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    .line 468
    :cond_3
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v4, :cond_4

    .line 470
    :try_start_6
    iget-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    invoke-interface {v4}, Lorg/kwis/msf/io/Socket;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 474
    :goto_3
    const/4 v4, 0x0

    :try_start_7
    iput-object v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    .line 476
    :cond_4
    const/4 v4, 0x0

    iput-boolean v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    .line 477
    const/4 v4, -0x1

    iput v4, v2, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    .line 478
    iget-object v4, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 446
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    .end local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .end local v3    # "numOfConnection":I
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 455
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    .restart local v2    # "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .restart local v3    # "numOfConnection":I
    :catch_0
    move-exception v1

    .line 456
    .local v1, "e":Ljava/io/IOException;
    :try_start_8
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "close failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 463
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 464
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "close failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 471
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 472
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "close failed:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_3
.end method

.method declared-synchronized returnConnection(Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;)V
    .locals 5
    .param p1, "rtnConn"    # Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    .line 353
    .local v2, "numOfConnection":I
    if-lez v2, :cond_1

    .line 355
    iget-object v3, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 356
    .local v0, "connEnum":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    .line 373
    .end local v0    # "connEnum":Ljava/util/Enumeration;
    :cond_1
    invoke-virtual {p0}, Lcom/beyond/io/http$HttpConnectionManager;->dump()V

    .line 374
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Connection not found"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 351
    .end local v2    # "numOfConnection":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 357
    .restart local v0    # "connEnum":Ljava/util/Enumeration;
    .restart local v2    # "numOfConnection":I
    :cond_2
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;

    .line 358
    .local v1, "hce":Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
    if-ne v1, p1, :cond_0

    .line 359
    iget-boolean v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    if-eqz v3, :cond_4

    .line 360
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->inUse:Z

    .line 361
    const/4 v3, -0x1

    iput v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->appID:I

    .line 362
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->soc:Lorg/kwis/msf/io/Socket;

    if-nez v3, :cond_3

    .line 363
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->in:Lcom/beyond/io/http$BufferedInputStream;

    if-nez v3, :cond_3

    .line 364
    iget-object v3, v1, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->out:Ljava/io/DataOutputStream;

    if-nez v3, :cond_3

    .line 365
    iget-object v3, p0, Lcom/beyond/io/http$HttpConnectionManager;->_conns:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 366
    :cond_3
    monitor-exit p0

    return-void

    .line 368
    :cond_4
    :try_start_2
    new-instance v3, Ljava/io/IOException;

    const-string v4, "return not in use connection"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method
