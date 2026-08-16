	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800520C
sub_0800520C: @ 0x0800520C
	push {r4, r5, lr}
	ldr r4, _08005264 @ =gUnknown_0200B0B0
	ldr r1, [r4]
	ldrh r2, [r1]
	ldr r0, _08005268 @ =0x0000FEFF
	ands r0, r2
	movs r5, #0
	strh r0, [r1]
	strb r5, [r1, #0x10]
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	ldr r1, _0800526C @ =gUnknown_0200B204
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08005288
	ldr r0, [r4]
	adds r0, #0x9c
	bl sub_080051EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800527C
	ldr r0, [r4]
	adds r0, #0x9c
	ldr r1, _08005270 @ =gUnknown_08610A38
	ldr r2, _08005274 @ =0x000027F8
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_08004E38
	ldr r2, [r4]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08005278 @ =gUnknown_08488164
	bl sub_080193B0
	b _080052CE
	.align 2, 0
_08005264: .4byte gUnknown_0200B0B0
_08005268: .4byte 0x0000FEFF
_0800526C: .4byte gUnknown_0200B204
_08005270: .4byte gUnknown_08610A38
_08005274: .4byte 0x000027F8
_08005278: .4byte gUnknown_08488164
_0800527C:
	ldr r0, _08005284 @ =gUnknown_084882E4
	bl sub_080193B0
	b _080052CE
	.align 2, 0
_08005284: .4byte gUnknown_084882E4
_08005288:
	ldr r0, [r4]
	adds r0, #0x9c
	bl sub_080051EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080052C8
	ldr r0, [r4]
	adds r0, #0x9c
	ldr r1, _080052BC @ =gUnknown_08610A38
	ldr r2, _080052C0 @ =0x000027F8
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_08004E38
	ldr r2, [r4]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080052C4 @ =gUnknown_08488224
	bl sub_080193B0
	b _080052CE
	.align 2, 0
_080052BC: .4byte gUnknown_08610A38
_080052C0: .4byte 0x000027F8
_080052C4: .4byte gUnknown_08488224
_080052C8:
	ldr r0, _080052D4 @ =gUnknown_08488394
	bl sub_080193B0
_080052CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080052D4: .4byte gUnknown_08488394

