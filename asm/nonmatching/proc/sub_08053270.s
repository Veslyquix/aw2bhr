	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053270
sub_08053270: @ 0x08053270
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08053F0C
	bl sub_080535E0
	ldr r0, _080532BC @ =gUnknown_08551A04
	ldr r0, [r0]
	ldr r1, _080532C0 @ =0x06002800
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r4, _080532C4 @ =gUnknown_03004508
	ldrh r1, [r4]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bne _0805329C
	adds r0, r5, #0
	bl Proc_Break
_0805329C:
	bl sub_0804B3CC
	bl sub_08053820
	ldr r2, _080532C8 @ =gUnknown_03004504
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080532CC
	ldrh r1, [r4]
	ldrh r0, [r2, #2]
	cmp r0, r1
	beq _080532D2
	adds r0, r1, #1
	b _080532D0
	.align 2, 0
_080532BC: .4byte gUnknown_08551A04
_080532C0: .4byte 0x06002800
_080532C4: .4byte gUnknown_03004508
_080532C8: .4byte gUnknown_03004504
_080532CC:
	ldrh r0, [r4]
	adds r0, #1
_080532D0:
	strh r0, [r4]
_080532D2:
	pop {r4, r5}
	pop {r0}
	bx r0

