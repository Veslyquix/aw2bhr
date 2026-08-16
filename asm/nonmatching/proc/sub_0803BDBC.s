	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BDBC
sub_0803BDBC: @ 0x0803BDBC
	push {r4, r5, lr}
	ldr r5, _0803BDF4 @ =gUnknown_03003FC0
	ldrb r4, [r5, #0xc]
	bl sub_08034848
	movs r2, #0
	strb r4, [r5, #0xc]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #1
	strb r1, [r5, #0xd]
	strb r1, [r5, #7]
	strb r1, [r5, #8]
	subs r0, #0x10
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BDF4: .4byte gUnknown_03003FC0

