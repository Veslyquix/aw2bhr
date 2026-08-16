	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F0A4
sub_0803F0A4: @ 0x0803F0A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x20]
	ldr r6, [sp, #0x24]
	movs r0, #0x2c
	movs r1, #0
	bl sub_08074410
	ldr r0, _0803F10C @ =gUnknown_0849F830
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	str r4, [r2, #0x54]
	str r5, [r2, #0x58]
	adds r0, #0x64
	movs r1, #0
	mov r3, r8
	strh r3, [r0]
	adds r0, #2
	mov r6, sb
	strh r6, [r0]
	adds r0, #2
	strh r7, [r0]
	adds r0, #2
	mov r3, sp
	ldrh r3, [r3, #0x1c]
	strh r3, [r0]
	str r1, [r2, #0x5c]
	adds r4, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r5, #1
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802909C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F10C: .4byte gUnknown_0849F830

