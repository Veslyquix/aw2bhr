	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080470F8
sub_080470F8: @ 0x080470F8
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _08047160 @ =gUnknown_02028DD6
	movs r2, #0x1f
	adds r1, r0, #0
	ands r1, r2
	strb r1, [r5]
	ldr r4, _08047164 @ =gUnknown_02028DD7
	bl sub_08024984
	strb r0, [r4]
	ldr r1, _08047168 @ =gUnknown_02028DD4
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, #0xf
	blt _0804712C
	cmp r0, #0x10
	ble _08047128
	cmp r0, #0x1f
	bgt _0804712C
	cmp r0, #0x15
	blt _0804712C
_08047128:
	movs r0, #0
	strb r0, [r1]
_0804712C:
	bl sub_08024268
	ldr r0, _0804716C @ =gUnknown_084C2140
	movs r1, #0
	bl sub_080152EC
	ldr r0, _08047170 @ =gUnknown_084C2198
	movs r1, #0
	bl sub_080152EC
	ldr r0, _08047174 @ =gUnknown_030033E4
	ldrh r1, [r0]
	ldr r0, _08047178 @ =gUnknown_08499590
	ldr r0, [r0]
	movs r2, #4
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _08047152
	adds r0, #0xf
_08047152:
	asrs r0, r0, #4
	subs r0, r1, r0
	cmp r0, #6
	bgt _08047180
	ldr r1, _0804717C @ =gUnknown_02028DD5
	movs r0, #0x80
	b _08047184
	.align 2, 0
_08047160: .4byte gUnknown_02028DD6
_08047164: .4byte gUnknown_02028DD7
_08047168: .4byte gUnknown_02028DD4
_0804716C: .4byte gUnknown_084C2140
_08047170: .4byte gUnknown_084C2198
_08047174: .4byte gUnknown_030033E4
_08047178: .4byte gUnknown_08499590
_0804717C: .4byte gUnknown_02028DD5
_08047180:
	ldr r1, _0804718C @ =gUnknown_02028DD5
	movs r0, #0
_08047184:
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804718C: .4byte gUnknown_02028DD5

