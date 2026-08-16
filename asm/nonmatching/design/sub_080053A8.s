	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080053A8
sub_080053A8: @ 0x080053A8
	push {r4, r5, lr}
	ldr r4, _08005404 @ =gUnknown_0200B0B0
	ldr r1, [r4]
	ldrh r2, [r1]
	ldr r0, _08005408 @ =0x0000FEFF
	ands r0, r2
	movs r5, #0
	strh r0, [r1]
	movs r0, #2
	strb r0, [r1, #0x10]
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	ldr r1, _0800540C @ =gUnknown_0200B204
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08005424
	ldr r0, [r4]
	adds r0, #0x9c
	bl sub_080051EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08005418
	ldr r0, [r4]
	adds r0, #0x9c
	ldr r1, _08005410 @ =gUnknown_08610A38
	movs r2, #0xa0
	lsls r2, r2, #6
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
	ldr r0, _08005414 @ =gUnknown_08488164
	bl sub_080193B0
	b _0800546A
	.align 2, 0
_08005404: .4byte gUnknown_0200B0B0
_08005408: .4byte 0x0000FEFF
_0800540C: .4byte gUnknown_0200B204
_08005410: .4byte gUnknown_08610A38
_08005414: .4byte gUnknown_08488164
_08005418:
	ldr r0, _08005420 @ =gUnknown_084882E4
	bl sub_080193B0
	b _0800546A
	.align 2, 0
_08005420: .4byte gUnknown_084882E4
_08005424:
	ldr r0, [r4]
	adds r0, #0x9c
	bl sub_080051EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08005464
	ldr r0, [r4]
	adds r0, #0x9c
	ldr r1, _0800545C @ =gUnknown_08610A38
	movs r2, #0xa0
	lsls r2, r2, #6
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
	ldr r0, _08005460 @ =gUnknown_08488224
	bl sub_080193B0
	b _0800546A
	.align 2, 0
_0800545C: .4byte gUnknown_08610A38
_08005460: .4byte gUnknown_08488224
_08005464:
	ldr r0, _08005470 @ =gUnknown_08488394
	bl sub_080193B0
_0800546A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08005470: .4byte gUnknown_08488394

