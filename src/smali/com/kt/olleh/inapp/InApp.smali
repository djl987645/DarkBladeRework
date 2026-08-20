.class Lcom/kt/olleh/inapp/InApp;
.super Ljava/lang/Object;
.source "InApp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/kt/olleh/inapp/InApp$NetworkTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "InApp"


# instance fields
.field private final RS_URL:Ljava/lang/String;

.field private final TB_URL:Ljava/lang/String;

.field private final crypto_param:Ljava/lang/String;

.field private mAES_URL:Ljava/lang/String;

.field private mAPI:Ljava/lang/String;

.field private mAPINext:Ljava/lang/String;

.field private final mApp_id:Ljava/lang/String;

.field private final mAppid:Ljava/lang/String;

.field private final mAuthen:Ljava/lang/String;

.field private final mBuy_pwd:Ljava/lang/String;

.field private final mBuy_type:Ljava/lang/String;

.field private final mDi_id:Ljava/lang/String;

.field private final mFile_name:Ljava/lang/String;

.field private final mIid:Ljava/lang/String;

.field private final mMime_type:Ljava/lang/String;

.field private mNetManager:Lcom/kt/olleh/inapp/net/NetworkManager;

.field private final mOpcode:Ljava/lang/String;

.field private final mPage:Ljava/lang/String;

.field private final mPage_size:Ljava/lang/String;

.field private final mPhone:Ljava/lang/String;

.field private final mPwd:Ljava/lang/String;

.field private final mRecipients:Ljava/lang/String;

.field private volatile mRun:Z

.field private mRunningTask:Lcom/kt/olleh/inapp/InApp$NetworkTask;

.field private mSeq_key:Ljava/lang/String;

.field private final mShow_id:Ljava/lang/String;

.field private mSymmetric_key:Ljava/lang/String;

.field private final mTr_id:Ljava/lang/String;

.field private final mUser_info:Ljava/lang/String;

.field private final seq_key:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/kt/olleh/inapp/InApp;->mRun:Z

    .line 37
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mNetManager:Lcom/kt/olleh/inapp/net/NetworkManager;

    .line 46
    const-string v0, "http://221.148.247.203:8888/INAP_GW/inap_gw/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->TB_URL:Ljava/lang/String;

    .line 47
    const-string v0, "http://inapppurchase.ollehmarket.com/INAP_GW/inap_gw/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->RS_URL:Ljava/lang/String;

    .line 49
    const-string v0, "crypto_param/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->crypto_param:Ljava/lang/String;

    .line 50
    const-string v0, "/seq_key/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->seq_key:Ljava/lang/String;

    .line 51
    const-string v0, "/app_id/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mApp_id:Ljava/lang/String;

    .line 52
    const-string v0, "/user_info/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mUser_info:Ljava/lang/String;

    .line 53
    const-string v0, "/authen/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mAuthen:Ljava/lang/String;

    .line 54
    const-string v0, "/page_size/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mPage_size:Ljava/lang/String;

    .line 55
    const-string v0, "/page/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mPage:Ljava/lang/String;

    .line 56
    const-string v0, "/recipients/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mRecipients:Ljava/lang/String;

    .line 57
    const-string v0, "/di_id/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mDi_id:Ljava/lang/String;

    .line 58
    const-string v0, "/buy_type/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mBuy_type:Ljava/lang/String;

    .line 59
    const-string v0, "/tr_id/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mTr_id:Ljava/lang/String;

    .line 60
    const-string v0, "/file_name/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mFile_name:Ljava/lang/String;

    .line 61
    const-string v0, "/mime_type/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mMime_type:Ljava/lang/String;

    .line 62
    const-string v0, "/show_id/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mShow_id:Ljava/lang/String;

    .line 63
    const-string v0, "/pwd/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mPwd:Ljava/lang/String;

    .line 64
    const-string v0, "/buy_pwd/"

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mBuy_pwd:Ljava/lang/String;

    .line 66
    const-string v0, "opcode="

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mOpcode:Ljava/lang/String;

    .line 67
    const-string v0, "&iid="

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mIid:Ljava/lang/String;

    .line 68
    const-string v0, "&appid="

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mAppid:Ljava/lang/String;

    .line 69
    const-string v0, "&phone="

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mPhone:Ljava/lang/String;

    .line 72
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 73
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 75
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mSymmetric_key:Ljava/lang/String;

    .line 76
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mSeq_key:Ljava/lang/String;

    .line 78
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mRunningTask:Lcom/kt/olleh/inapp/InApp$NetworkTask;

    .line 79
    return-void
.end method

.method static synthetic access$0(Lcom/kt/olleh/inapp/InApp;Lcom/kt/olleh/inapp/net/NetworkManager;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/kt/olleh/inapp/InApp;->mNetManager:Lcom/kt/olleh/inapp/net/NetworkManager;

    return-void
.end method

.method static synthetic access$1(Lcom/kt/olleh/inapp/InApp;)Lcom/kt/olleh/inapp/net/NetworkManager;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mNetManager:Lcom/kt/olleh/inapp/net/NetworkManager;

    return-object v0
.end method

.method static synthetic access$10(Lcom/kt/olleh/inapp/InApp;Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0, p1, p2, p3}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$11(Lcom/kt/olleh/inapp/InApp;Z)V
    .locals 0

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/kt/olleh/inapp/InApp;->mRun:Z

    return-void
.end method

.method static synthetic access$2(Lcom/kt/olleh/inapp/InApp;)Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/kt/olleh/inapp/InApp;->mRun:Z

    return v0
.end method

.method static synthetic access$3(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/kt/olleh/inapp/InApp;->mSymmetric_key:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$6(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 44
    iput-object p1, p0, Lcom/kt/olleh/inapp/InApp;->mSeq_key:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$7(Lcom/kt/olleh/inapp/InApp;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$8(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$9(Lcom/kt/olleh/inapp/InApp;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 40
    iput-object p1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    return-void
.end method

.method private networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "api"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 101
    new-instance v0, Lcom/kt/olleh/inapp/InApp$NetworkTask;

    invoke-direct {v0, p0, p1}, Lcom/kt/olleh/inapp/InApp$NetworkTask;-><init>(Lcom/kt/olleh/inapp/InApp;Lcom/kt/olleh/inapp/OnInAppListener;)V

    .line 102
    .local v0, "task":Lcom/kt/olleh/inapp/InApp$NetworkTask;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    aput-object p3, v1, v3

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 103
    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mRunningTask:Lcom/kt/olleh/inapp/InApp$NetworkTask;

    .line 104
    iput-boolean v3, p0, Lcom/kt/olleh/inapp/InApp;->mRun:Z

    .line 105
    const/4 v0, 0x0

    .line 106
    return-void
.end method


# virtual methods
.method public getDIAllList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "page_size"    # I
    .param p5, "page"    # I
    .param p6, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 173
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 174
    const-string v1, "getAllDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 176
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", page_size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", page = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 182
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 183
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 184
    const-string v2, "/page_size/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 185
    const-string v2, "/page/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 180
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 187
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p6, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    return-void
.end method

.method public getDIAllList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 201
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 202
    const-string v1, "getAllDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 204
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 210
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 211
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 208
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 213
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method public getDIDownloadableList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 337
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 338
    const-string v1, "getDownloadDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 340
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 345
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 346
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 347
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 344
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 349
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    return-void
.end method

.method public getDIGiftList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 257
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 258
    const-string v1, "getGiftDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 260
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 266
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 267
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 264
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 269
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    return-void
.end method

.method public getDIGiftList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "recipients"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 230
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 231
    const-string v1, "getGiftDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 233
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", recipients = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 239
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 240
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 241
    const-string v2, "/recipients/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 237
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 243
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p5, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    return-void
.end method

.method public getDIInformation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 310
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 311
    const-string v1, "getDiDetail"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 313
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 315
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", di_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 318
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 319
    const-string v2, "/di_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 320
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 321
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 317
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 323
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p5, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    return-void
.end method

.method public getDIPurchaseList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 145
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 146
    const-string v1, "getBuyDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 154
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 155
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 152
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 157
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    return-void
.end method

.method public getDIReceiveList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 283
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 284
    const-string v1, "getReceiveDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 286
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 288
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 292
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 293
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 290
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 295
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method public getDIUsableList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "user_info"    # Ljava/lang/String;
    .param p3, "authen"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 119
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 120
    const-string v1, "getUseDiList"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 128
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 129
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 126
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 131
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public getMainURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 85
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->bTBserver:Z

    if-eqz v1, :cond_0

    .line 88
    const-string v0, "http://221.148.247.203:8888/INAP_GW/inap_gw/"

    .line 96
    .local v0, "url":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 93
    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    const-string v0, "http://inapppurchase.ollehmarket.com/INAP_GW/inap_gw/"

    .restart local v0    # "url":Ljava/lang/String;
    goto :goto_0
.end method

.method public requestCancel()V
    .locals 2

    .prologue
    .line 744
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mRunningTask:Lcom/kt/olleh/inapp/InApp$NetworkTask;

    if-eqz v0, :cond_0

    .line 745
    iget-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mRunningTask:Lcom/kt/olleh/inapp/InApp$NetworkTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/InApp$NetworkTask;->cancel(Z)Z

    .line 747
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/kt/olleh/inapp/InApp;->mRunningTask:Lcom/kt/olleh/inapp/InApp$NetworkTask;

    .line 748
    return-void
.end method

.method public requestCheckCoin(Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "user_info"    # Ljava/lang/String;
    .param p2, "authen"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 725
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 726
    const-string v1, "checkCoin"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 728
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 730
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: user_info = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 733
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 734
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 732
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 736
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p3, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    return-void
.end method

.method public requestCheckShowId(Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "show_id"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 697
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 698
    const-string v1, "checkShowId"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 700
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 702
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: show_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", pwd = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 705
    const-string v2, "/show_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 706
    const-string v2, "/pwd/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 704
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 708
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p3, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 709
    return-void
.end method

.method public requestDIApproveDown(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 639
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 640
    const-string v1, "approvedDownDi"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 642
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 644
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", di_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 647
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 648
    const-string v2, "/di_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 649
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 650
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 646
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 652
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p5, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 653
    return-void
.end method

.method public requestDIApproveUse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 611
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 612
    const-string v1, "approvedUseDi"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 614
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 616
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", di_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 618
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 619
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 620
    const-string v2, "/di_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 621
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 622
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 618
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 624
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p5, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    return-void
.end method

.method public requestDIBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "buy_type"    # Ljava/lang/String;
    .param p6, "buy_pwd"    # Ljava/lang/String;
    .param p7, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 366
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 367
    const-string v1, "buyDi"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 369
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 372
    const-string v3, ", di_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 373
    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 374
    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 375
    const-string v3, ", buy_type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 376
    const-string v3, ", buy_pwd = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 371
    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 379
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 380
    const-string v2, "/di_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 381
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 382
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 383
    const-string v2, "/buy_type/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 384
    const-string v2, "/buy_pwd/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 378
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 386
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p7, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    return-void
.end method

.method public requestDIBuyCancel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "tr_id"    # Ljava/lang/String;
    .param p6, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 461
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 462
    const-string v1, "buyCancelDi"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 464
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 466
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", di_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", tr_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 469
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 470
    const-string v2, "/di_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 471
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 472
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 473
    const-string v2, "/tr_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 468
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 475
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p6, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    return-void
.end method

.method public requestDIGift(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "buy_type"    # Ljava/lang/String;
    .param p6, "buy_pwd"    # Ljava/lang/String;
    .param p7, "recipients"    # Ljava/lang/String;
    .param p8, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 521
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 522
    const-string v1, "giftDi"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 524
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 526
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: app_id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 527
    const-string v3, ", di_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 528
    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 529
    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 530
    const-string v3, ", buy_type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 531
    const-string v3, ", buy_pwd = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 532
    const-string v3, ", recipients = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 526
    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 535
    const-string v2, "/app_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 536
    const-string v2, "/di_id/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 537
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 538
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 539
    const-string v2, "/buy_type/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 540
    const-string v2, "/buy_pwd/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 541
    const-string v2, "/recipients/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 534
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 543
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p8, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    return-void
.end method

.method public requestDIReBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "buy_type"    # Ljava/lang/String;
    .param p6, "buy_pwd"    # Ljava/lang/String;
    .param p7, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 406
    const-string v3, "buyDi"

    iput-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 407
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 409
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "InApp"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Parameter :: app_id = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 410
    const-string v5, ", di_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 411
    const-string v5, ", user_info = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 412
    const-string v5, ", authen = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 413
    const-string v5, ", buy_type = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 414
    const-string v5, ", buy_pwd = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 409
    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 417
    const-string v4, "/app_id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 418
    const-string v4, "/di_id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 419
    const-string v4, "/user_info/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 420
    const-string v4, "/authen/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 421
    const-string v4, "/buy_type/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 422
    const-string v4, "/buy_pwd/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 416
    iput-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 424
    const/4 v0, 0x0

    .line 428
    .local v0, "aesURL":Ljava/lang/String;
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mSymmetric_key:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    if-nez v3, :cond_2

    .line 430
    :cond_1
    const-string v3, "0000"

    const-string v4, "\uc774\uc804 \uad6c\ub9e4 \ub0b4\uc5ed \uc5c6\uc74c"

    invoke-interface {p7, v3, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnError(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    :cond_2
    :try_start_0
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 434
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mSymmetric_key:Ljava/lang/String;

    iget-object v4, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/crypt/AESCrypt;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 440
    :cond_3
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "crypto_param/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/seq_key/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/kt/olleh/inapp/InApp;->mSeq_key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 442
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p7, v2, v3}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    return-void

    .line 436
    .end local v2    # "url":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 437
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "InApp"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "AESCrypter ::"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestDIReGift(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "buy_type"    # Ljava/lang/String;
    .param p6, "buy_pwd"    # Ljava/lang/String;
    .param p7, "recipients"    # Ljava/lang/String;
    .param p8, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 561
    const-string v3, "reGiftDi"

    iput-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 562
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 565
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "InApp"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Parameter :: app_id = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 566
    const-string v5, ", di_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 567
    const-string v5, ", user_info = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 568
    const-string v5, ", authen = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 569
    const-string v5, ", buy_type = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 570
    const-string v5, ", buy_pwd = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 571
    const-string v5, ", recipients = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 565
    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 573
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 574
    const-string v4, "/app_id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 575
    const-string v4, "/di_id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 576
    const-string v4, "/user_info/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 577
    const-string v4, "/authen/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 578
    const-string v4, "/buy_type/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 579
    const-string v4, "/buy_pwd/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 580
    const-string v4, "/recipients/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 573
    iput-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 582
    const/4 v0, 0x0

    .line 583
    .local v0, "aesURL":Ljava/lang/String;
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mSymmetric_key:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    if-nez v3, :cond_2

    .line 585
    :cond_1
    const-string v3, "0000"

    const-string v4, "\uc774\uc804 \uc120\ubb3c \uad6c\ub9e4 \ub0b4\uc5ed \uc5c6\uc74c"

    invoke-interface {p8, v3, v4}, Lcom/kt/olleh/inapp/OnInAppListener;->OnError(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    :cond_2
    :try_start_0
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 589
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mSymmetric_key:Ljava/lang/String;

    iget-object v4, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/crypt/AESCrypt;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 595
    :cond_3
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "crypto_param/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/seq_key/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/kt/olleh/inapp/InApp;->mSeq_key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 596
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p8, v2, v3}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    return-void

    .line 591
    .end local v2    # "url":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 592
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "InApp"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "AESCrypter ::"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestDIesBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "iid"    # Ljava/lang/String;
    .param p2, "appid"    # Ljava/lang/String;
    .param p3, "phone"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 488
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 489
    const-string v1, "esBuyDi"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 491
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 493
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: iid = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 494
    const-string v3, ", appid = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 495
    const-string v3, ", phone = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 493
    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 498
    const-string v2, "opcode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 499
    const-string v2, "&iid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 500
    const-string v2, "&appid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 501
    const-string v2, "&phone="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 497
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 503
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p4, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    return-void
.end method

.method public requestDIgetFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 4
    .param p1, "file_name"    # Ljava/lang/String;
    .param p2, "mime_type"    # Ljava/lang/String;
    .param p3, "user_info"    # Ljava/lang/String;
    .param p4, "authen"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 669
    const-string v1, "getSymKeyGen"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    .line 670
    const-string v1, "getFile"

    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    .line 672
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/InApp;->getMainURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 674
    .local v0, "url":Ljava/lang/String;
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "InApp"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Parameter :: file_name = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mime_type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", user_info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", authen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 676
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/kt/olleh/inapp/InApp;->mAPINext:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 677
    const-string v2, "/file_name/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 678
    const-string v2, "/mime_type/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 679
    const-string v2, "/user_info/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 680
    const-string v2, "/authen/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 676
    iput-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAES_URL:Ljava/lang/String;

    .line 682
    iget-object v1, p0, Lcom/kt/olleh/inapp/InApp;->mAPI:Ljava/lang/String;

    invoke-direct {p0, p5, v0, v1}, Lcom/kt/olleh/inapp/InApp;->networkTaskStart(Lcom/kt/olleh/inapp/OnInAppListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    return-void
.end method
