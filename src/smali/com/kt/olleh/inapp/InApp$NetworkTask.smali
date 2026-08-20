.class Lcom/kt/olleh/inapp/InApp$NetworkTask;
.super Landroid/os/AsyncTask;
.source "InApp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kt/olleh/inapp/InApp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NetworkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private mCurrentAPI:Ljava/lang/String;

.field private mLastError:I

.field private mLastHttpCode:I

.field private mListener:Lcom/kt/olleh/inapp/OnInAppListener;

.field final synthetic this$0:Lcom/kt/olleh/inapp/InApp;


# direct methods
.method public constructor <init>(Lcom/kt/olleh/inapp/InApp;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 1
    .param p2, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 760
    iput-object p1, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    .line 757
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 758
    iput-object p2, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 759
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mCurrentAPI:Ljava/lang/String;

    return-void
.end method

.method private sendErrorReason(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 1012
    if-nez p1, :cond_0

    .line 1013
    const-string p1, "code null"

    .line 1015
    :cond_0
    if-nez p2, :cond_1

    .line 1016
    const-string p2, "reason null"

    .line 1019
    :cond_1
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    if-eqz v0, :cond_3

    .line 1021
    const-string v0, "B007"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1023
    const-string p2, "\uad6c\ub9e4\ud55c\ub3c4\ub97c \ucd08\uacfc\ud558\uc5ec \ub354 \uc774\uc0c1 \uad6c\ub9e4\ud558\uc2e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4."

    .line 1034
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-interface {v0, p1, p2}, Lcom/kt/olleh/inapp/OnInAppListener;->OnError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1036
    :cond_3
    return-void

    .line 1025
    :cond_4
    const-string v0, "B009"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1027
    const-string p2, "\uc77c\ubcc4 \uad6c\ub9e4\ud55c\ub3c4\ub97c \ucd08\uacfc\ud558\uc5ec \ub354 \uc774\uc0c1 \uad6c\ub9e4\ud558\uc2e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4."

    goto :goto_0

    .line 1029
    :cond_5
    const-string v0, "B010"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1031
    const-string p2, "\uc6d4\ubcc4 \uad6c\ub9e4\ud55c\ub3c4\ub97c \ucd08\uacfc\ud558\uc5ec \ub354 \uc774\uc0c1 \uad6c\ub9e4\ud558\uc2e4 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4."

    goto :goto_0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    .line 770
    const/4 v1, 0x0

    aget-object v0, p1, v1

    .line 771
    .local v0, "url":Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v1, p1, v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mCurrentAPI:Ljava/lang/String;

    .line 775
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    new-instance v2, Lcom/kt/olleh/inapp/net/NetworkManager;

    invoke-direct {v2}, Lcom/kt/olleh/inapp/net/NetworkManager;-><init>()V

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/InApp;->access$0(Lcom/kt/olleh/inapp/InApp;Lcom/kt/olleh/inapp/net/NetworkManager;)V

    .line 776
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v1}, Lcom/kt/olleh/inapp/InApp;->access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/kt/olleh/inapp/net/NetworkManager;->getData(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->doInBackground([Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 1005
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 1006
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/InApp;->access$11(Lcom/kt/olleh/inapp/InApp;Z)V

    .line 1007
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v0}, Lcom/kt/olleh/inapp/InApp;->access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/net/NetworkManager;->cancel()V

    .line 1008
    return-void
.end method

.method protected onPostExecute(Ljava/io/InputStream;)V
    .locals 11
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v10, 0x0

    .line 791
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 793
    const/4 p1, 0x0

    .line 997
    :cond_0
    :goto_0
    return-void

    .line 797
    :cond_1
    if-eqz p1, :cond_1f

    .line 799
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 802
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mCurrentAPI:Ljava/lang/String;

    const-string v8, "esBuyDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 804
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mCurrentAPI:Ljava/lang/String;

    invoke-static {p1, v7}, Lcom/kt/olleh/inapp/net/XMLParser;->parseXML_OLD(Ljava/io/InputStream;Ljava/lang/String;)Lcom/kt/olleh/inapp/net/ResponseOld;

    move-result-object v3

    .line 805
    .local v3, "old":Lcom/kt/olleh/inapp/net/ResponseOld;
    if-eqz v3, :cond_2

    .line 807
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 808
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, v3, Lcom/kt/olleh/inapp/net/ResponseOld;->mResultCode:Ljava/lang/String;

    iget-object v9, v3, Lcom/kt/olleh/inapp/net/ResponseOld;->mResultMessage:Ljava/lang/String;

    invoke-interface {v7, v8, v9}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultOLDAPI(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 812
    :cond_2
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/kt/olleh/inapp/net/NetworkManager;->getLastError()I

    move-result v7

    iput v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mLastError:I

    .line 813
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/kt/olleh/inapp/net/NetworkManager;->getLastHttpCode()I

    move-result v7

    iput v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mLastHttpCode:I

    .line 815
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 816
    const-string v7, "A015"

    const-string v8, "\uc11c\ubc84 \uc694\uccad \uc751\ub2f5 \uc2dc\uac04 \ucd08\uacfc"

    invoke-direct {p0, v7, v8}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->sendErrorReason(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 822
    .end local v3    # "old":Lcom/kt/olleh/inapp/net/ResponseOld;
    :cond_3
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mCurrentAPI:Ljava/lang/String;

    invoke-static {p1, v7}, Lcom/kt/olleh/inapp/net/XMLParser;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/kt/olleh/inapp/net/Response;

    move-result-object v5

    .line 823
    .local v5, "response":Lcom/kt/olleh/inapp/net/Response;
    if-eqz v5, :cond_0

    .line 825
    const-string v7, "0"

    iget-object v8, v5, Lcom/kt/olleh/inapp/net/Response;->mCode:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 827
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 828
    iget-object v7, v5, Lcom/kt/olleh/inapp/net/Response;->mCode:Ljava/lang/String;

    iget-object v8, v5, Lcom/kt/olleh/inapp/net/Response;->mReason:Ljava/lang/String;

    invoke-direct {p0, v7, v8}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->sendErrorReason(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 832
    :cond_4
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_5

    const-string v7, "InApp"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "onPostExecute("

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v9}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") called"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    :cond_5
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getSymKeyGen"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    move-object v4, v5

    .line 836
    check-cast v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;

    .line 839
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$4(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "buyDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 840
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$4(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "giftDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 843
    :cond_6
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    iget-object v8, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mSymmetric_key:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/InApp;->access$5(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V

    .line 844
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    iget-object v8, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mSeq_key:Ljava/lang/String;

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/InApp;->access$6(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V

    .line 852
    :goto_1
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_7

    const-string v7, "InApp"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "onPostExecute("

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mSymmetric_key:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mSeq_key:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 854
    :cond_7
    const/4 v1, 0x0

    .line 855
    .local v1, "aesURL":Ljava/lang/String;
    const/4 v0, 0x0

    .line 857
    .local v0, "aesReplaceURL":Ljava/lang/String;
    const-string v7, "0"

    iget-object v8, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mCode:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 860
    :try_start_0
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$7(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_c

    .line 861
    iget-object v7, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mSymmetric_key:Ljava/lang/String;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$7(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/crypt/AESCrypt;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 863
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_8

    const-string v7, "InApp"

    const-string v8, "#################################################################"

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    :cond_8
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_9

    const-string v7, "InApp"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "mAES_URL = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v9}, Lcom/kt/olleh/inapp/InApp;->access$7(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 865
    :cond_9
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_a

    const-string v7, "InApp"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "aesURL = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 866
    :cond_a
    const/16 v7, 0x2f

    const/16 v8, 0x24

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 867
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_b

    const-string v7, "InApp"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "aesReplaceURL = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 868
    :cond_b
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_c

    const-string v7, "InApp"

    const-string v8, "#################################################################"

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 874
    :cond_c
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-virtual {v8}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "crypto_param/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/seq_key/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mSeq_key:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 875
    .local v6, "url":Ljava/lang/String;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$4(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_11

    .line 877
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$4(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/InApp;->access$8(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V

    .line 878
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7, v10}, Lcom/kt/olleh/inapp/InApp;->access$9(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V

    .line 880
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 882
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getFile"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 883
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    const-string v8, "0"

    invoke-interface {v7, v8, v6}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultFileURL(Ljava/lang/String;Ljava/lang/String;)V

    .line 891
    :cond_d
    :goto_3
    const/4 v6, 0x0

    .line 900
    :cond_e
    :goto_4
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 848
    .end local v0    # "aesReplaceURL":Ljava/lang/String;
    .end local v1    # "aesURL":Ljava/lang/String;
    .end local v6    # "url":Ljava/lang/String;
    :cond_f
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7, v10}, Lcom/kt/olleh/inapp/InApp;->access$5(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V

    .line 849
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7, v10}, Lcom/kt/olleh/inapp/InApp;->access$6(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 870
    .restart local v0    # "aesReplaceURL":Ljava/lang/String;
    .restart local v1    # "aesURL":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 871
    .local v2, "e":Ljava/lang/Exception;
    const-string v7, "InApp"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "AESCrypter ::"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 887
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v6    # "url":Ljava/lang/String;
    :cond_10
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v9, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v9}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v6, v9}, Lcom/kt/olleh/inapp/InApp;->access$10(Lcom/kt/olleh/inapp/InApp;Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 896
    :cond_11
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 897
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v5}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto :goto_4

    .line 904
    .end local v6    # "url":Ljava/lang/String;
    :cond_12
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 905
    iget-object v7, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mCode:Ljava/lang/String;

    iget-object v8, v4, Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;->mReason:Ljava/lang/String;

    invoke-direct {p0, v7, v8}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->sendErrorReason(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 908
    .end local v0    # "aesReplaceURL":Ljava/lang/String;
    .end local v1    # "aesURL":Ljava/lang/String;
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResGetSymKeyGen;
    :cond_13
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getUseDiList"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_14

    .line 909
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getDownloadDiList"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_15

    :cond_14
    move-object v4, v5

    .line 912
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIListExpand;

    .line 913
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIListExpand;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 914
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 916
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIListExpand;
    :cond_15
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getBuyDiList"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 917
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getAllDiList"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 918
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getGiftDiList"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 919
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getReceiveDiList"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    :cond_16
    move-object v4, v5

    .line 922
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIList;

    .line 923
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIList;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 924
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 926
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIList;
    :cond_17
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getDiDetail"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_18

    move-object v4, v5

    .line 928
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIDetail;

    .line 929
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIDetail;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 930
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 932
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIDetail;
    :cond_18
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "buyDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_19

    .line 933
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "buyCancelDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_19

    .line 934
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "giftDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_19

    .line 935
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "reGiftDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_19

    .line 936
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "approvedUseDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    :cond_19
    move-object v4, v5

    .line 939
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIBuy;

    .line 940
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIBuy;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 941
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 943
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIBuy;
    :cond_1a
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "esBuyDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1b

    move-object v4, v5

    .line 945
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIesBuy;

    .line 946
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIesBuy;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 947
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 949
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIesBuy;
    :cond_1b
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "approvedDownDi"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1c

    move-object v4, v5

    .line 951
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIApproveDown;

    .line 952
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIApproveDown;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 953
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 955
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIApproveDown;
    :cond_1c
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getFile"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d

    move-object v4, v5

    .line 957
    check-cast v4, Lcom/kt/olleh/inapp/net/ResDIGetFile;

    .line 958
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResDIGetFile;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 959
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 961
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResDIGetFile;
    :cond_1d
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "checkShowId"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1e

    move-object v4, v5

    .line 963
    check-cast v4, Lcom/kt/olleh/inapp/net/ResCheckShowId;

    .line 965
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResCheckShowId;
    iget-object v7, v4, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mShow_id:Ljava/lang/String;

    sput-object v7, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    .line 967
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 968
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 970
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResCheckShowId;
    :cond_1e
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "checkCoin"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    move-object v4, v5

    .line 972
    check-cast v4, Lcom/kt/olleh/inapp/net/ResCheckCoin;

    .line 973
    .local v4, "res":Lcom/kt/olleh/inapp/net/ResCheckCoin;
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 974
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget-object v8, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v8}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V

    goto/16 :goto_0

    .line 981
    .end local v4    # "res":Lcom/kt/olleh/inapp/net/ResCheckCoin;
    .end local v5    # "response":Lcom/kt/olleh/inapp/net/Response;
    :cond_1f
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/kt/olleh/inapp/net/NetworkManager;->getLastError()I

    move-result v7

    iput v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mLastError:I

    .line 982
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/kt/olleh/inapp/net/NetworkManager;->getLastHttpCode()I

    move-result v7

    iput v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->mLastHttpCode:I

    .line 984
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "getFile"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 992
    iget-object v7, p0, Lcom/kt/olleh/inapp/InApp$NetworkTask;->this$0:Lcom/kt/olleh/inapp/InApp;

    invoke-static {v7}, Lcom/kt/olleh/inapp/InApp;->access$2(Lcom/kt/olleh/inapp/InApp;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 993
    const-string v7, "A015"

    const-string v8, "\uc11c\ubc84\uc5d0 \uc811\uc18d\ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4. \ub124\ud2b8\uc6cc\ud06c \uc0c1\ud0dc\ub97c \ud655\uc778\ud574\uc8fc\uc138\uc694."

    invoke-direct {p0, v7, v8}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->sendErrorReason(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/io/InputStream;

    invoke-virtual {p0, p1}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->onPostExecute(Ljava/io/InputStream;)V

    return-void
.end method
