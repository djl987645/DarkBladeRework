.class Lcom/beyond/AppThread$1;
.super Ljava/lang/Object;
.source "CletActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/AppThread;->knlshowExitDlg([C[C)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/AppThread;


# direct methods
.method constructor <init>(Lcom/beyond/AppThread;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/AppThread$1;->this$0:Lcom/beyond/AppThread;

    .line 1506
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x0

    .line 1508
    invoke-static {}, Lcom/beyond/AppThread;->access$0()Lcom/beyond/DialogInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1509
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1510
    invoke-static {v1}, Lcom/beyond/AppThread;->access$1(Lcom/beyond/DialogInfo;)V

    .line 1512
    :cond_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 1513
    invoke-static {v1}, Lcom/beyond/AppThread;->access$1(Lcom/beyond/DialogInfo;)V

    .line 1514
    iget-object v0, p0, Lcom/beyond/AppThread$1;->this$0:Lcom/beyond/AppThread;

    invoke-static {v0}, Lcom/beyond/AppThread;->access$2(Lcom/beyond/AppThread;)Lcom/beyond/CletActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/beyond/CletActivity;->finish()V

    .line 1517
    :cond_1
    return-void
.end method
