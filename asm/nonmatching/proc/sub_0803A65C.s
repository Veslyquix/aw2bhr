	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A65C
sub_0803A65C: @ 0x0803A65C
	push {r4, lr}
	ldr r4, _0803A694 @ =gUnknown_0849D89C
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #9]
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #2
	bl sub_08023274
	ldr r0, _0803A698 @ =gUnknown_0849E2C0
	movs r1, #0
	bl sub_080152EC
	ldr r1, [r4]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	movs r2, #0x10
	movs r3, #0xa
	bl sub_0801A444
	movs r0, #2
	bl sub_08013AD4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A694: .4byte gUnknown_0849D89C
_0803A698: .4byte gUnknown_0849E2C0

