.class Lcom/beyond/KtDrmCheckActivity$1;
.super Ljava/lang/Object;
.source "KtDrmCheckActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/KtDrmCheckActivity;->showDialogDRM(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/KtDrmCheckActivity;


# direct methods
.method constructor <init>(Lcom/beyond/KtDrmCheckActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/KtDrmCheckActivity$1;->this$0:Lcom/beyond/KtDrmCheckActivity;

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 159
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 160
    iget-object v0, p0, Lcom/beyond/KtDrmCheckActivity$1;->this$0:Lcom/beyond/KtDrmCheckActivity;

    iget v0, v0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    const/4 v1, -0x5

    if-eq v0, v1, :cond_0

    .line 163
    iget-object v0, p0, Lcom/beyond/KtDrmCheckActivity$1;->this$0:Lcom/beyond/KtDrmCheckActivity;

    invoke-virtual {v0}, Lcom/beyond/KtDrmCheckActivity;->onDestroy()V

    .line 165
    :cond_0
    return-void
.end method
