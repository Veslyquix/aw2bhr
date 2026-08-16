	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BA4C
sub_0801BA4C: @ 0x0801BA4C
	adds r2, r0, #0
	ldr r1, _0801BA8C @ =gUnknown_0808F048
	cmp r2, #0
	bge _0801BA5E
	movs r0, #0xb4
	lsls r0, r0, #1
_0801BA58:
	adds r2, r2, r0
	cmp r2, #0
	blt _0801BA58
_0801BA5E:
	ldr r0, _0801BA90 @ =0x00000167
	cmp r2, r0
	ble _0801BA6C
	ldr r3, _0801BA94 @ =0xFFFFFE98
_0801BA66:
	adds r2, r2, r3
	cmp r2, r0
	bgt _0801BA66
_0801BA6C:
	adds r3, r2, #0
	cmp r2, #0xb3
	ble _0801BA74
	subs r2, #0xb4
_0801BA74:
	cmp r2, #0x5a
	ble _0801BA7C
	movs r0, #0xb4
	subs r2, r0, r2
_0801BA7C:
	cmp r3, #0xb3
	bgt _0801BA98
	ldr r0, [r1]
	lsls r1, r2, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	b _0801BAA6
	.align 2, 0
_0801BA8C: .4byte gUnknown_0808F048
_0801BA90: .4byte 0x00000167
_0801BA94: .4byte 0xFFFFFE98
_0801BA98:
	ldr r1, [r1]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0801BAA6:
	bx lr

