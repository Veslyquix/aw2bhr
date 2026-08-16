	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A7C4
sub_0802A7C4: @ 0x0802A7C4
	push {r4, r5, r6, lr}
	ldr r0, _0802A820 @ =gUnknown_03003FC0
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0802A818
	ldr r0, _0802A824 @ =sub_0802AA78
	movs r1, #1
	bl sub_0801F024
	bl sub_08012358
	ldr r2, _0802A828 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	movs r6, #1
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _0802A82C @ =gUnknown_03001FFC
	movs r0, #5
	strh r0, [r1]
	ldr r1, _0802A830 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0802A834 @ =gUnknown_03002B28
	movs r0, #0
	strh r0, [r1]
_0802A818:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A820: .4byte gUnknown_03003FC0
_0802A824: .4byte sub_0802AA78
_0802A828: .4byte gUnknown_030030E0
_0802A82C: .4byte gUnknown_03001FFC
_0802A830: .4byte gUnknown_03002020
_0802A834: .4byte gUnknown_03002B28

