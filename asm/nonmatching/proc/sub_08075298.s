	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075298
sub_08075298: @ 0x08075298
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080752D4 @ =gUnknown_08614390
	mov r1, r8
	bl Proc_Start
	strh r4, [r0, #0x34]
	strh r5, [r0, #0x36]
	mov r1, sb
	str r1, [r0, #0x2c]
	strh r6, [r0, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080752D4: .4byte gUnknown_08614390

