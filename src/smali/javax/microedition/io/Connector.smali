.class public Ljavax/microedition/io/Connector;
.super Ljava/lang/Object;
.source "Connector.java"


# static fields
.field public static final READ:I = 0x1

.field public static final READ_WRITE:I = 0x3

.field public static final WRITE:I = 0x2

.field private static classRoot:Ljava/lang/String;

.field private static j2me:Z

.field private static platform:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 137
    const/4 v0, 0x0

    sput-boolean v0, Ljavax/microedition/io/Connector;->j2me:Z

    .line 149
    const-string v0, "microedition.configuration"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 150
    const/4 v0, 0x1

    sput-boolean v0, Ljavax/microedition/io/Connector;->j2me:Z

    .line 154
    :cond_0
    const-string v0, "microedition.platform"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljavax/microedition/io/Connector;->platform:Ljava/lang/String;

    .line 157
    const-string v0, "javax.microedition.io.Connector.protocolpath"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljavax/microedition/io/Connector;->classRoot:Ljava/lang/String;

    .line 159
    sget-object v0, Ljavax/microedition/io/Connector;->classRoot:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 161
    const-string v0, "com.sun.midp.io"

    sput-object v0, Ljavax/microedition/io/Connector;->classRoot:Ljava/lang/String;

    .line 84
    :cond_1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static open(Ljava/lang/String;)Ljavax/microedition/io/Connection;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    const/4 v0, 0x3

    invoke-static {p0, v0}, Ljavax/microedition/io/Connector;->open(Ljava/lang/String;I)Ljavax/microedition/io/Connection;

    move-result-object v0

    return-object v0
.end method

.method public static open(Ljava/lang/String;I)Ljavax/microedition/io/Connection;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Ljavax/microedition/io/Connector;->open(Ljava/lang/String;IZ)Ljavax/microedition/io/Connection;

    move-result-object v0

    return-object v0
.end method

.method public static open(Ljava/lang/String;IZ)Ljavax/microedition/io/Connection;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .param p2, "timeouts"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    sget-object v1, Ljavax/microedition/io/Connector;->platform:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 227
    :try_start_0
    sget-object v1, Ljavax/microedition/io/Connector;->platform:Ljava/lang/String;

    invoke-static {p0, p1, p2, v1}, Ljavax/microedition/io/Connector;->openPrim(Ljava/lang/String;IZLjava/lang/String;)Ljavax/microedition/io/Connection;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 235
    :goto_0
    return-object v1

    .line 228
    :catch_0
    move-exception v0

    .line 229
    .local v0, "x":Ljava/lang/ClassNotFoundException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Connector.open(): Point 1"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 235
    .end local v0    # "x":Ljava/lang/ClassNotFoundException;
    :cond_0
    :try_start_1
    sget-boolean v1, Ljavax/microedition/io/Connector;->j2me:Z

    if-eqz v1, :cond_1

    const-string v1, "j2me"

    :goto_1
    invoke-static {p0, p1, p2, v1}, Ljavax/microedition/io/Connector;->openPrim(Ljava/lang/String;IZLjava/lang/String;)Ljavax/microedition/io/Connection;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, "j2se"
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 236
    :catch_1
    move-exception v0

    .line 237
    .restart local v0    # "x":Ljava/lang/ClassNotFoundException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Connector.open(): Point 2"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 240
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Connector.open(): Point 3"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 241
    new-instance v1, Ljavax/microedition/io/ConnectionNotFoundException;

    .line 242
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "The requested protocol does not exist "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 241
    invoke-direct {v1, v2}, Ljavax/microedition/io/ConnectionNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static openDataInputStream(Ljava/lang/String;)Ljava/io/DataInputStream;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    const/4 v1, 0x1

    invoke-static {p0, v1}, Ljavax/microedition/io/Connector;->open(Ljava/lang/String;I)Ljavax/microedition/io/Connection;

    move-result-object v0

    check-cast v0, Ljavax/microedition/io/InputConnection;

    .line 346
    .local v0, "con":Ljavax/microedition/io/InputConnection;
    :try_start_0
    invoke-interface {v0}, Ljavax/microedition/io/InputConnection;->openDataInputStream()Ljava/io/DataInputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 348
    invoke-interface {v0}, Ljavax/microedition/io/InputConnection;->close()V

    .line 346
    return-object v1

    .line 347
    :catchall_0
    move-exception v1

    .line 348
    invoke-interface {v0}, Ljavax/microedition/io/InputConnection;->close()V

    .line 349
    throw v1
.end method

.method public static openDataOutputStream(Ljava/lang/String;)Ljava/io/DataOutputStream;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    const/4 v1, 0x2

    invoke-static {p0, v1}, Ljavax/microedition/io/Connector;->open(Ljava/lang/String;I)Ljavax/microedition/io/Connection;

    move-result-object v0

    check-cast v0, Ljavax/microedition/io/OutputConnection;

    .line 370
    .local v0, "con":Ljavax/microedition/io/OutputConnection;
    :try_start_0
    invoke-interface {v0}, Ljavax/microedition/io/OutputConnection;->openDataOutputStream()Ljava/io/DataOutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 372
    invoke-interface {v0}, Ljavax/microedition/io/OutputConnection;->close()V

    .line 370
    return-object v1

    .line 371
    :catchall_0
    move-exception v1

    .line 372
    invoke-interface {v0}, Ljavax/microedition/io/OutputConnection;->close()V

    .line 373
    throw v1
.end method

.method public static openInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-static {p0}, Ljavax/microedition/io/Connector;->openDataInputStream(Ljava/lang/String;)Ljava/io/DataInputStream;

    move-result-object v0

    return-object v0
.end method

.method public static openOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 407
    invoke-static {p0}, Ljavax/microedition/io/Connector;->openDataOutputStream(Ljava/lang/String;)Ljava/io/DataOutputStream;

    move-result-object v0

    return-object v0
.end method

.method private static openPrim(Ljava/lang/String;IZLjava/lang/String;)Ljavax/microedition/io/Connection;
    .locals 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .param p2, "timeouts"    # Z
    .param p3, "platform"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 267
    if-nez p0, :cond_0

    .line 268
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Null URL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 272
    :cond_0
    const/16 v4, 0x3a

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 275
    .local v1, "colon":I
    const/4 v4, 0x1

    if-ge v1, v4, :cond_1

    .line 276
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "no \':\' in URL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 283
    :cond_1
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 284
    .local v2, "protocol":Ljava/lang/String;
    const-string v4, "ssl"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 286
    new-instance v4, Ljavax/microedition/io/ConnectionNotFoundException;

    const-string v5, "Protocol not supported"

    invoke-direct {v4, v5}, Ljavax/microedition/io/ConnectionNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    .end local v2    # "protocol":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 322
    .local v3, "x":Ljava/io/IOException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Connector.openPrim(): point 2"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 323
    new-instance v4, Ljavax/microedition/io/ConnectionNotFoundException;

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/microedition/io/ConnectionNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 290
    .end local v3    # "x":Ljava/io/IOException;
    .restart local v2    # "protocol":Ljava/lang/String;
    :cond_2
    add-int/lit8 v4, v1, 0x1

    :try_start_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 295
    new-instance v4, Ljava/lang/StringBuilder;

    sget-object v5, Ljavax/microedition/io/Connector;->classRoot:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 296
    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 297
    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".Protocol"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 295
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    .line 304
    .local v0, "clazz":Ljava/lang/Class;
    const/4 v4, 0x0

    return-object v4
.end method
