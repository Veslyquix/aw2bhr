	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BA4C
sub_0803BA4C: @ 0x0803BA4C
	push {lr}
	bl sub_0803BA1C
	bl sub_080846F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BA64
	movs r0, #1
	bl sub_08038690
	b _0803BA6A
_0803BA64:
	movs r0, #0
	bl sub_08038690
_0803BA6A:
	bl sub_08016E74
	ldr r0, _0803BA80 @ =gUnknown_03003FC0
	movs r1, #1
	strb r1, [r0, #1]
	ldr r0, _0803BA84 @ =gUnknown_0849EB34
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803BA80: .4byte gUnknown_03003FC0
_0803BA84: .4byte gUnknown_0849EB34

