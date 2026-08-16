	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080113EC
sub_080113EC: @ 0x080113EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, _08011430 @ =gUnknown_03002F3C
	adds r1, r6, #0
	adds r1, #0x64
	ldrh r0, [r3]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	ldr r1, _08011434 @ =0x013F0000
	cmp r0, r1
	ble _08011412
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r3]
_08011412:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bgt _0801143C
	ldr r4, _08011438 @ =gUnknown_0808DF90
	ldr r5, [r4]
	movs r2, #0xa0
	lsls r2, r2, #1
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r2, [sp]
	movs r0, #0
	b _0801144E
	.align 2, 0
_08011430: .4byte gUnknown_03002F3C
_08011434: .4byte 0x013F0000
_08011438: .4byte gUnknown_0808DF90
_0801143C:
	ldr r4, _0801147C @ =gUnknown_0808DF90
	ldr r5, [r4]
	movs r2, #0xa0
	lsls r2, r2, #1
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r2, [sp]
	movs r0, #4
_0801144E:
	movs r1, #0
	bl Interpolate
	strh r0, [r5]
	ldr r4, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08011480 @ =0x0000013F
	cmp r0, r1
	ble _08011484
	adds r1, #1
	adds r0, r1, #0
	strh r0, [r4]
	bl sub_08011300
	bl sub_08011354
	adds r0, r6, #0
	bl Proc_Break
	b _08011496
	.align 2, 0
_0801147C: .4byte gUnknown_0808DF90
_08011480: .4byte 0x0000013F
_08011484:
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _08011496
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r4]
_08011496:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

