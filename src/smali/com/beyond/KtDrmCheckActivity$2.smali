.class Lcom/beyond/KtDrmCheckActivity$2;
.super Ljava/lang/Object;
.source "KtDrmCheckActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


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
    iput-object p1, p0, Lcom/beyond/KtDrmCheckActivity$2;->this$0:Lcom/beyond/KtDrmCheckActivity;

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x4

    const/4 v2, -0x5

    .line 176
    if-ne p2, v1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/beyond/KtDrmCheckActivity$2;->this$0:Lcom/beyond/KtDrmCheckActivity;

    iget v0, v0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    if-eq v0, v2, :cond_0

    .line 181
    iget-object v0, p0, Lcom/beyond/KtDrmCheckActivity$2;->this$0:Lcom/beyond/KtDrmCheckActivity;

    invoke-virtual {v0}, Lcom/beyond/KtDrmCheckActivity;->onDestroy()V

    .line 184
    :cond_0
    if-ne p2, v1, :cond_1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 186
    iget-object v0, p0, Lcom/beyond/KtDrmCheckActivity$2;->this$0:Lcom/beyond/KtDrmCheckActivity;

    iget v0, v0, Lcom/beyond/KtDrmCheckActivity;->drmResult:I

    if-eq v0, v2, :cond_1

    .line 189
    iget-object v0, p0, Lcom/beyond/KtDrmCheckActivity$2;->this$0:Lcom/beyond/KtDrmCheckActivity;

    invoke-virtual {v0}, Lcom/beyond/KtDrmCheckActivity;->onDestroy()V

    .line 195
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
