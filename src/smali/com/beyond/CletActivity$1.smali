.class Lcom/beyond/CletActivity$1;
.super Ljava/lang/Object;
.source "CletActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/CletActivity;->showExitDlg()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/CletActivity;


# direct methods
.method constructor <init>(Lcom/beyond/CletActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/CletActivity$1;->this$0:Lcom/beyond/CletActivity;

    .line 796
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 798
    if-eqz p1, :cond_0

    .line 799
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 800
    :cond_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 802
    iget-object v0, p0, Lcom/beyond/CletActivity$1;->this$0:Lcom/beyond/CletActivity;

    invoke-virtual {v0}, Lcom/beyond/CletActivity;->finish()V

    .line 806
    :goto_0
    return-void

    .line 805
    :cond_1
    invoke-static {}, Lcom/beyond/CletActivity;->access$4()Lcom/beyond/AppThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/beyond/AppThread;->pltResume()V

    goto :goto_0
.end method
