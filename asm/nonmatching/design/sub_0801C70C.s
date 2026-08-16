	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C70C
sub_0801C70C: @ 0x0801C70C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r1
	mov sb, r2
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #1
	bl sub_0801C210
	adds r4, r0, #0
	adds r1, r5, #0
	bl sub_0801C4D4
	strh r6, [r4, #0x22]
	ldr r0, _0801C750 @ =gUnknown_0848B5AC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	mov r1, sb
	str r1, [r0, #0x58]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801C750: .4byte gUnknown_0848B5AC

