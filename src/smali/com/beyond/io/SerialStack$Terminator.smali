.class Lcom/beyond/io/SerialStack$Terminator;
.super Ljava/lang/Thread;
.source "SerialStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/SerialStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Terminator"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 835
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 839
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/beyond/io/SerialStack;->getExitAppID()I

    move-result v1

    .line 840
    .local v1, "id":I
    invoke-static {v1}, Lcom/beyond/io/SerialStack;->freeByID(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 842
    .end local v1    # "id":I
    :catch_0
    move-exception v0

    .line 843
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Terminator:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 845
    return-void
.end method
