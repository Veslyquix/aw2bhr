	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080452FC
sub_080452FC: @ 0x080452FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08045350 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0804534A
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x40]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	ldr r0, _08045354 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1f]
	cmp r0, #2
	bne _0804533A
	movs r6, #1
_0804533A:
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r6, #0
	bl sub_08044B08
	adds r0, r4, #0
	bl Proc_Break
_0804534A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045350: .4byte gUnknown_0849A00C
_08045354: .4byte gUnknown_08499598

