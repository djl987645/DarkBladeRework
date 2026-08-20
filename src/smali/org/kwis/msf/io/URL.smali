.class public Lorg/kwis/msf/io/URL;
.super Ljava/lang/Object;
.source "URL.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static find(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/kwis/msf/io/SchemeNotFoundException;
        }
    .end annotation

    .prologue
    .line 10
    :try_start_0
    invoke-static {p0}, Lcom/beyond/io/ConnectionFactory;->findScheme(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 11
    :catch_0
    move-exception v0

    .line 12
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/kwis/msf/io/SchemeNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "can\'t find socket for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/kwis/msf/io/SchemeNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
