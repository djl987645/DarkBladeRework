.class Lcom/beyond/MediaBridge$1;
.super Ljava/lang/Object;
.source "MediaBridge.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/MediaBridge;->setMPListenerComplete()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/MediaBridge;


# direct methods
.method constructor <init>(Lcom/beyond/MediaBridge;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/MediaBridge$1;->this$0:Lcom/beyond/MediaBridge;

    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 4
    .param p1, "player"    # Landroid/media/MediaPlayer;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 279
    const/4 v1, 0x4

    new-array v0, v1, [I

    .line 280
    .local v0, "evt":[I
    const/16 v1, 0x1004

    aput v1, v0, v2

    .line 281
    aput v2, v0, v3

    .line 282
    const/4 v1, 0x2

    aput v3, v0, v1

    .line 283
    const/4 v1, 0x3

    iget-object v2, p0, Lcom/beyond/MediaBridge$1;->this$0:Lcom/beyond/MediaBridge;

    iget v2, v2, Lcom/beyond/MediaBridge;->playerID:I

    aput v2, v0, v1

    .line 284
    sget-object v1, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v1, v0}, Lcom/beyond/JletBridge;->postEvent([I)Z

    .line 285
    return-void
.end method
