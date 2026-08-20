.class Lcom/kt/olleh/inapp/KTInAppActivity$1;
.super Ljava/lang/Object;
.source "KTInAppActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kt/olleh/inapp/KTInAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kt/olleh/inapp/KTInAppActivity;


# direct methods
.method constructor <init>(Lcom/kt/olleh/inapp/KTInAppActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kt/olleh/inapp/KTInAppActivity$1;->this$0:Lcom/kt/olleh/inapp/KTInAppActivity;

    .line 891
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 900
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "KTInAppActivity"

    const-string v2, " ** onServiceConnected"

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 902
    :cond_0
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity$1;->this$0:Lcom/kt/olleh/inapp/KTInAppActivity;

    invoke-static {p2}, Lcom/kt/olleh/inapp/IRemoteInapService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/kt/olleh/inapp/IRemoteInapService;

    move-result-object v2

    iput-object v2, v1, Lcom/kt/olleh/inapp/KTInAppActivity;->mService:Lcom/kt/olleh/inapp/IRemoteInapService;

    .line 904
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity$1;->this$0:Lcom/kt/olleh/inapp/KTInAppActivity;

    iget-object v1, v1, Lcom/kt/olleh/inapp/KTInAppActivity;->mService:Lcom/kt/olleh/inapp/IRemoteInapService;

    if-eqz v1, :cond_2

    .line 908
    :try_start_0
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity$1;->this$0:Lcom/kt/olleh/inapp/KTInAppActivity;

    iget-object v1, v1, Lcom/kt/olleh/inapp/KTInAppActivity;->mService:Lcom/kt/olleh/inapp/IRemoteInapService;

    invoke-interface {v1}, Lcom/kt/olleh/inapp/IRemoteInapService;->getPhoneNumber()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    .line 910
    sget-boolean v1, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "KTInAppActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SoIP Phone number = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 913
    :cond_1
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity$1;->this$0:Lcom/kt/olleh/inapp/KTInAppActivity;

    invoke-static {v1}, Lcom/kt/olleh/inapp/KTInAppActivity;->access$0(Lcom/kt/olleh/inapp/KTInAppActivity;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 919
    :cond_2
    :goto_0
    return-void

    .line 914
    :catch_0
    move-exception v0

    .line 916
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 894
    sget-boolean v0, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "KTInAppActivity"

    const-string v1, " onServiceDisconnected"

    invoke-static {v0, v1}, Lcom/kt/olleh/inapp/Config/Config;->LogI(Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    :cond_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity$1;->this$0:Lcom/kt/olleh/inapp/KTInAppActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/kt/olleh/inapp/KTInAppActivity;->mService:Lcom/kt/olleh/inapp/IRemoteInapService;

    .line 896
    return-void
.end method
