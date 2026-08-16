	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023274
sub_08023274: @ 0x08023274
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080232C4 @ =gUnknown_030033E4
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	asrs r0, r0, #0x10
	ldrh r1, [r1, #2]
	lsls r1, r1, #0x14
	asrs r1, r1, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r5, sp
	adds r5, #6
	str r5, [sp]
	adds r2, r4, #0
	add r3, sp, #4
	bl sub_08023168
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, _080232C8 @ =gUnknown_08499590
	ldr r2, [r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r2, r4, #0
	bl sub_08043418
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080232C4: .4byte gUnknown_030033E4
_080232C8: .4byte gUnknown_08499590

