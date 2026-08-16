	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075E68
sub_08075E68: @ 0x08075E68
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _08075EBC @ =gUnknown_08614410
	bl Proc_StartBlocking
	adds r4, r0, #0
	str r5, [r4, #0x58]
	adds r0, r5, #0
	mov r1, sp
	bl sub_08074834
	mov r0, sp
	adds r0, #2
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, _08075EC0 @ =gUnknown_0202FDFC
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	str r0, [r4, #0x2c]
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	str r0, [r4, #0x30]
	ldr r0, [sp, #8]
	str r0, [r4, #0x54]
	adds r2, #0x12
	adds r5, r5, r2
	ldrb r1, [r5]
	movs r0, #0xfe
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075EBC: .4byte gUnknown_08614410
_08075EC0: .4byte gUnknown_0202FDFC

