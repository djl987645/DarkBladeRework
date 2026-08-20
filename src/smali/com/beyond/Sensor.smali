.class public Lcom/beyond/Sensor;
.super Ljava/lang/Object;
.source "Sensor.java"

# interfaces
.implements Landroid/hardware/SensorListener;


# static fields
.field private static isClet:Z


# instance fields
.field private lastUpdate:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput-boolean v0, Lcom/beyond/Sensor;->isClet:Z

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/beyond/Sensor;->lastUpdate:J

    .line 14
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "Clet"    # Z

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/beyond/Sensor;->lastUpdate:J

    .line 17
    sput-boolean p1, Lcom/beyond/Sensor;->isClet:Z

    .line 18
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(II)V
    .locals 0
    .param p1, "sensor"    # I
    .param p2, "accuracy"    # I

    .prologue
    .line 21
    return-void
.end method

.method public onSensorChanged(I[F)V
    .locals 12
    .param p1, "sensor"    # I
    .param p2, "values"    # [F

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const v8, 0x411ce80a

    const/high16 v7, 0x42c80000    # 100.0f

    .line 26
    if-ne p1, v11, :cond_0

    .line 28
    sget-boolean v3, Lcom/beyond/Sensor;->isClet:Z

    if-nez v3, :cond_2

    .line 29
    const/4 v3, 0x4

    new-array v2, v3, [I

    .line 30
    .local v2, "evt":[I
    const/16 v3, 0x9

    aput v3, v2, v9

    .line 31
    sget-object v3, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    invoke-virtual {v3}, Lcom/beyond/BeyondActivity;->getRequestedOrientation()I

    move-result v3

    if-nez v3, :cond_1

    .line 32
    aget v3, p2, v9

    neg-float v3, v3

    mul-float/2addr v3, v7

    float-to-int v3, v3

    aput v3, v2, v10

    .line 35
    :goto_0
    aget v3, p2, v10

    mul-float/2addr v3, v7

    float-to-int v3, v3

    aput v3, v2, v11

    .line 36
    const/4 v3, 0x3

    aget v4, p2, v11

    mul-float/2addr v4, v7

    float-to-int v4, v4

    aput v4, v2, v3

    .line 38
    sget-object v3, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v3, v2}, Lcom/beyond/JletBridge;->postEvent([I)Z

    .line 57
    .end local v2    # "evt":[I
    :cond_0
    :goto_1
    return-void

    .line 34
    .restart local v2    # "evt":[I
    :cond_1
    aget v3, p2, v9

    mul-float/2addr v3, v7

    float-to-int v3, v3

    aput v3, v2, v10

    goto :goto_0

    .line 40
    .end local v2    # "evt":[I
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 41
    .local v0, "curTime":J
    iget-wide v3, p0, Lcom/beyond/Sensor;->lastUpdate:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0x64

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    .line 43
    iput-wide v0, p0, Lcom/beyond/Sensor;->lastUpdate:J

    .line 44
    sget-object v3, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    invoke-virtual {v3}, Lcom/beyond/BeyondActivity;->getRequestedOrientation()I

    move-result v3

    if-nez v3, :cond_3

    .line 45
    aget v3, p2, v9

    div-float/2addr v3, v8

    neg-float v3, v3

    mul-float/2addr v3, v7

    float-to-int v3, v3

    .line 46
    aget v4, p2, v10

    div-float/2addr v4, v8

    mul-float/2addr v4, v7

    float-to-int v4, v4

    .line 47
    aget v5, p2, v11

    div-float/2addr v5, v8

    mul-float/2addr v5, v7

    float-to-int v5, v5

    .line 45
    invoke-static {v3, v4, v5}, Lcom/beyond/CletActivity;->sendMotionEvent(III)V

    goto :goto_1

    .line 51
    :cond_3
    aget v3, p2, v9

    div-float/2addr v3, v8

    mul-float/2addr v3, v7

    float-to-int v3, v3

    .line 52
    aget v4, p2, v10

    div-float/2addr v4, v8

    mul-float/2addr v4, v7

    float-to-int v4, v4

    .line 53
    aget v5, p2, v11

    div-float/2addr v5, v8

    mul-float/2addr v5, v7

    float-to-int v5, v5

    .line 51
    invoke-static {v3, v4, v5}, Lcom/beyond/CletActivity;->sendMotionEvent(III)V

    goto :goto_1
.end method
