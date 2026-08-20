.class public Lcom/beyond/BacklightManager;
.super Ljava/lang/Object;
.source "BacklightManager.java"


# static fields
.field static pm:Landroid/os/PowerManager;

.field static wl:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 8
    sput-object v0, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    .line 9
    sput-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static alwaysOn()V
    .locals 4

    .prologue
    .line 46
    :try_start_0
    sget-object v1, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_0

    .line 47
    sget-object v1, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 48
    :cond_0
    sget-object v1, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    if-nez v1, :cond_3

    .line 49
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    if-eqz v1, :cond_1

    .line 50
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    sput-object v1, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    .line 52
    :cond_1
    sget-object v1, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    if-eqz v1, :cond_2

    .line 53
    sget-object v1, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    sput-object v1, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    .line 56
    :cond_2
    sget-object v1, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    if-nez v1, :cond_3

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 59
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    sget-object v1, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    const/16 v2, 0xa

    const-string v3, "AlwaysOn"

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    .line 60
    sget-object v1, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 61
    sget-object v1, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static before()V
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_0

    .line 42
    :goto_0
    return-void

    .line 38
    :cond_0
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 39
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 41
    :cond_1
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    goto :goto_0
.end method

.method public static off()V
    .locals 0

    .prologue
    .line 31
    invoke-static {}, Lcom/beyond/BacklightManager;->before()V

    .line 32
    return-void
.end method

.method public static on(III)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "color"    # I
    .param p2, "duration"    # I

    .prologue
    .line 12
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 13
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 15
    :cond_0
    sget-object v0, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    if-nez v0, :cond_3

    .line 16
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 17
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    sput-object v0, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    .line 19
    :cond_1
    sget-object v0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    if-eqz v0, :cond_2

    .line 20
    sget-object v0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    sput-object v0, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    .line 22
    :cond_2
    sget-object v0, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    if-nez v0, :cond_3

    .line 28
    :goto_0
    return-void

    .line 25
    :cond_3
    sget-object v0, Lcom/beyond/BacklightManager;->pm:Landroid/os/PowerManager;

    const/16 v1, 0xa

    const-string v2, "On"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    sput-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    .line 26
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 27
    sget-object v0, Lcom/beyond/BacklightManager;->wl:Landroid/os/PowerManager$WakeLock;

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    goto :goto_0
.end method
