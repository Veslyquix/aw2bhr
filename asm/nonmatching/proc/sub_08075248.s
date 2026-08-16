	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075248
sub_08075248: @ 0x08075248
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0807528C @ =gUnknown_0861436C
	ldrh r0, [r5, #0x3a]
	lsrs r0, r0, #3
	movs r1, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x34
	ldrsh r1, [r5, r2]
	movs r3, #0x36
	ldrsh r2, [r5, r3]
	adds r2, r2, r0
	ldr r3, _08075290 @ =gUnknown_081CC4F0
	ldr r4, _08075294 @ =gUnknown_0861433C
	ldrh r0, [r5, #0x38]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEBC
	ldrh r0, [r5, #0x3a]
	adds r0, #1
	strh r0, [r5, #0x3a]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807528C: .4byte gUnknown_0861436C
_08075290: .4byte gUnknown_081CC4F0
_08075294: .4byte gUnknown_0861433C

