.class Lcom/beyond/JletActivity$2;
.super Ljava/lang/Object;
.source "JletActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/JletActivity;->showExitDlg()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/JletActivity;


# direct methods
.method constructor <init>(Lcom/beyond/JletActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/JletActivity$2;->this$0:Lcom/beyond/JletActivity;

    .line 472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 474
    if-eqz p1, :cond_0

    .line 475
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 476
    :cond_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 477
    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v0}, Lcom/beyond/JletBridge;->notifyDestroyed()V

    .line 481
    :goto_0
    return-void

    .line 480
    :cond_1
    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v0}, Lcom/beyond/JletBridge;->requestResumed()V

    goto :goto_0
.end method
