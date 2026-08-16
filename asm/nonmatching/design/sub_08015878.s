	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015878
sub_08015878: @ 0x08015878
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r6, sp
	adds r0, r3, #0
	mov r1, sp
	str r3, [sp, #8]
	bl sub_0801566C
	ldr r1, _080158CC @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	ldrh r1, [r6, #4]
	ldr r0, _080158D0 @ =0xFFFFFC00
	ands r0, r1
	orrs r0, r4
	strh r0, [r6, #4]
	lsls r5, r5, #4
	ldrb r1, [r6, #5]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r5
	strb r0, [r6, #5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r3, #0
	bl sub_08015608
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080158CC: .4byte 0x000003FF
_080158D0: .4byte 0xFFFFFC00

