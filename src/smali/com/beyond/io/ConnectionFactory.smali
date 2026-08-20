.class public Lcom/beyond/io/ConnectionFactory;
.super Ljava/lang/Object;
.source "ConnectionFactory.java"


# static fields
.field public static net_bill_type:I

.field static vec:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21
    const/4 v0, 0x0

    sput v0, Lcom/beyond/io/ConnectionFactory;->net_bill_type:I

    .line 23
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/beyond/io/ConnectionFactory;->vec:Ljava/util/Vector;

    .line 26
    sget-object v0, Lcom/beyond/io/ConnectionFactory;->vec:Ljava/util/Vector;

    const-string v1, "com.beyond.io"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addPath(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 30
    if-eqz p0, :cond_0

    .line 31
    sget-object v0, Lcom/beyond/io/ConnectionFactory;->vec:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 32
    :cond_0
    return-void
.end method

.method public static findScheme(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 10
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 44
    if-nez p0, :cond_0

    .line 45
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "bad URI"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 47
    :cond_0
    const/16 v7, 0x3a

    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 48
    .local v1, "colon":I
    if-ge v1, v8, :cond_1

    .line 49
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "bad URI: \':\' expected after scheme"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 50
    :cond_1
    const/4 v7, 0x0

    invoke-virtual {p0, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 51
    .local v6, "scheme":Ljava/lang/String;
    if-nez v6, :cond_2

    .line 52
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "bad URI: no scheme specified"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 55
    :cond_2
    const-string v7, "BillSocket"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 56
    sget v7, Lcom/beyond/io/ConnectionFactory;->net_bill_type:I

    if-ne v7, v8, :cond_4

    .line 57
    const-string v6, "BBillSocket"

    .line 64
    :cond_3
    :goto_0
    add-int/lit8 v7, v1, 0x1

    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 66
    const/4 v2, 0x0

    .line 67
    .local v2, "cs":Lcom/beyond/io/SocketModel;
    sget-object v7, Lcom/beyond/io/ConnectionFactory;->vec:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-nez v7, :cond_5

    .line 76
    if-nez v2, :cond_6

    .line 77
    new-instance v7, Lorg/kwis/msf/io/SchemeNotFoundException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "not supported scheme:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/kwis/msf/io/SchemeNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 59
    .end local v2    # "cs":Lcom/beyond/io/SocketModel;
    .end local v3    # "e":Ljava/util/Enumeration;
    :cond_4
    sget v7, Lcom/beyond/io/ConnectionFactory;->net_bill_type:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_3

    .line 60
    const-string v6, "BillSocket"

    goto :goto_0

    .line 68
    .restart local v2    # "cs":Lcom/beyond/io/SocketModel;
    .restart local v3    # "e":Ljava/util/Enumeration;
    :cond_5
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 70
    .local v5, "path":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 71
    .local v4, "justclass":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Lcom/beyond/io/SocketModel;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 79
    .end local v4    # "justclass":Ljava/lang/Class;
    .end local v5    # "path":Ljava/lang/String;
    :cond_6
    invoke-virtual {v2, p0}, Lcom/beyond/io/SocketModel;->parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v7

    return-object v7

    .line 72
    .restart local v5    # "path":Ljava/lang/String;
    :catch_0
    move-exception v7

    goto :goto_1
.end method

.method public static getAllPath()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/beyond/io/ConnectionFactory;->vec:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public static removePath(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 35
    if-eqz p0, :cond_0

    .line 36
    sget-object v0, Lcom/beyond/io/ConnectionFactory;->vec:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 37
    :cond_0
    return-void
.end method
