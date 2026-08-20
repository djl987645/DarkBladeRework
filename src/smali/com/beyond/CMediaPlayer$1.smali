.class Lcom/beyond/CMediaPlayer$1;
.super Ljava/lang/Object;
.source "CletActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/CMediaPlayer;->play()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/CMediaPlayer;


# direct methods
.method constructor <init>(Lcom/beyond/CMediaPlayer;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/CMediaPlayer$1;->this$0:Lcom/beyond/CMediaPlayer;

    .line 967
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "arg0"    # Landroid/media/MediaPlayer;

    .prologue
    .line 969
    iget-object v0, p0, Lcom/beyond/CMediaPlayer$1;->this$0:Lcom/beyond/CMediaPlayer;

    invoke-static {v0}, Lcom/beyond/CMediaPlayer;->access$0(Lcom/beyond/CMediaPlayer;)Lcom/beyond/AppThread;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 970
    iget-object v0, p0, Lcom/beyond/CMediaPlayer$1;->this$0:Lcom/beyond/CMediaPlayer;

    invoke-static {v0}, Lcom/beyond/CMediaPlayer;->access$0(Lcom/beyond/CMediaPlayer;)Lcom/beyond/AppThread;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/beyond/AppThread;->BhandleMediaEvent(Landroid/media/MediaPlayer;I)V

    .line 972
    :cond_0
    return-void
.end method
